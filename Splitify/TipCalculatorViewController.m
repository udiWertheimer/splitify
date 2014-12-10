//
//  ViewController.m
//  Bits with Friends
//
//  Created by Udi on 12/1/14.
//  Copyright (c) 2014 IIC. All rights reserved.
//

#import "TipCalculatorViewController.h"
#import "TipCalculator.h"

@interface TipCalculatorViewController ()

@property (nonatomic, strong) TipCalculator *tipCalculator;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentageSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *friendsCountStepper;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountPerFriendLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end

@implementation TipCalculatorViewController

static const int DEFAULT_TIP_PERCENTAGE = 12;

- (TipCalculator *)tipCalculator
{
    if (!_tipCalculator) {
        _tipCalculator = [[TipCalculator alloc] init];
        _tipCalculator.tipPercentage = DEFAULT_TIP_PERCENTAGE;
    }
    return _tipCalculator;
}

- (IBAction)BillAmountEditingChanged:(UITextField *)sender {
    self.tipCalculator.billAmountInCents = [sender.text floatValue] * 100;
    [self updateUI];
}

- (void) updateUI
{
    self.tipAmountLabel.text = [self formatAmountWithCents:self.tipCalculator.calculateTipAmountInCents];
    
    self.amountPerFriendLabel.text = [self formatAmountWithCents:self.tipCalculator.calculateAmountPerFriendInCents];
    
    self.totalLabel.text = [self formatAmountWithCents:self.tipCalculator.calculateTotalInCents];
}

- (NSString *)formatAmountWithCents:(NSUInteger)cents
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
    return [nf stringFromNumber:@(cents / 100.0)];
}

- (IBAction)friendCountStepperValueChanged:(UIStepper *)sender {
    self.tipCalculator.friendsCount = sender.value;
    self.friendsCountLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    [self updateUI];
}

- (IBAction)tipSliderValueChanged:(UISlider *)sender {
    self.tipCalculator.tipPercentage = sender.value;
    self.tipPercentageLabel.text = [self formatPercents:sender.value];
    [self updateUI];
}

- (NSString *)formatPercents:(NSUInteger)percents
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterPercentStyle];
    return [nf stringFromNumber:@(percents / 100.0)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tipPercentageLabel.text = [self formatPercents:self.tipCalculator.tipPercentage];
    
    self.tipPercentageSlider.value = self.tipCalculator.tipPercentage;
    
    self.friendsCountLabel.text = [NSString stringWithFormat:@"%d", (int)self.tipCalculator.friendsCount];
    
    self.friendsCountStepper.value = self.tipCalculator.friendsCount;
    
    [self updateUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.billAmountTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
