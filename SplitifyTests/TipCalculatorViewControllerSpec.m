#import "Kiwi.h"
#import "TipCalculatorViewController.h"

@interface TipCalculatorViewController()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentageSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *friendsCountStepper;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountPerFriendLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)BillAmountEditingChanged:(UITextField *)sender;
- (IBAction)friendCountStepperValueChanged:(UIStepper *)sender;
- (IBAction)tipSliderValueChanged:(UISlider *)sender;
@end

SPEC_BEGIN(TipCalculatorViewControllerSpec)

describe(@"Tip Calculator View Controller", ^{
    __block TipCalculatorViewController *tipCalculatorVC;
    
    beforeEach(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        tipCalculatorVC = [storyboard instantiateViewControllerWithIdentifier:@"TipCalculatorViewController"];
        UIView *aView = tipCalculatorVC.view;
        aView = nil;
        storyboard = nil;
    });
    
    context(@"after being loaded", ^{
        beforeEach(^{
            [tipCalculatorVC viewDidLoad];
        });
        
        it(@"sets the tip percentage label to 12%" ,^{
            [[tipCalculatorVC.tipPercentageLabel.text should] equal:@"12%"];
        });
        
        it(@"sets the tip percentage label to 12", ^{
            [[theValue(tipCalculatorVC.tipPercentageSlider.value) should] equal:theValue(12)];
        });
        
        it(@"sets the  friends count label to 1", ^{
            [[tipCalculatorVC.friendsCountLabel.text should] equal:@"1"];
        });
        
        it(@"sets the friends count stepper to 1", ^{
            [[theValue(tipCalculatorVC.friendsCountStepper.value) should] equal:theValue(1)];
        });
        
        it(@"has its tip amount label showing $0.00", ^{
            [[tipCalculatorVC.tipAmountLabel.text should] equal:@"$0.00"];
        });
        
        it(@"has its amount per friend label showing $0.00", ^{
            [[tipCalculatorVC.amountPerFriendLabel.text should] equal:@"$0.00"];
        });
        
        it(@"has its total label showing $0.00", ^{
            [[tipCalculatorVC.totalLabel.text should] equal:@"$0.00"];
        });
    });
    
    context(@"when appearing", ^{
        it(@"sets the bill amount field as a first responder", ^{
            [[tipCalculatorVC.billAmountTextField should] receive:@selector(becomeFirstResponder)];
            [tipCalculatorVC viewDidAppear:NO];
        });
    });
    
    context(@"when bill amount is $12.00", ^{
        beforeEach(^{
            tipCalculatorVC.billAmountTextField.text = @"12";
            [tipCalculatorVC BillAmountEditingChanged:tipCalculatorVC.billAmountTextField];
        });
        
        context(@"with 12% tip and 1 friend", ^{
            it(@"has a tip amount of $1.44", ^{
                [[tipCalculatorVC.tipAmountLabel.text should] equal:@"$1.44"];
            });
            
            it(@"has an amount per friend of $13.44", ^{
                [[tipCalculatorVC.amountPerFriendLabel.text should] equal:@"$13.44"];
            });
            
            it(@"has a total of $13.44", ^{
                [[tipCalculatorVC.totalLabel.text should] equal:@"$13.44"];
            });
        });
        
        context(@"with 12% tip and 2 friends", ^{
            beforeEach(^{
                tipCalculatorVC.friendsCountStepper.value = 2;
                [tipCalculatorVC friendCountStepperValueChanged:tipCalculatorVC.friendsCountStepper];
            });
            
            it(@"has its friends count label showing 2", ^{
                [[tipCalculatorVC.friendsCountLabel.text should] equal:@"2"];
            });
            
            it(@"has a tip amount of $1.44", ^{
                [[tipCalculatorVC.tipAmountLabel.text should] equal:@"$1.44"];
            });
            
            it(@"has an amount per friend of $6.72", ^{
                [[tipCalculatorVC.amountPerFriendLabel.text should] equal:@"$6.72"];
            });
            
            it(@"has a total of $13.44", ^{
                [[tipCalculatorVC.totalLabel.text should] equal:@"$13.44"];
            });
        });
        
        context(@"with 15% tip and 3 friends", ^{
            beforeEach(^{
                tipCalculatorVC.friendsCountStepper.value = 3;
                [tipCalculatorVC friendCountStepperValueChanged:tipCalculatorVC.friendsCountStepper];
                
                tipCalculatorVC.tipPercentageSlider.value = 15;
                [tipCalculatorVC tipSliderValueChanged:tipCalculatorVC.tipPercentageSlider];
            });
            
            it(@"has its friends count label showing 3", ^{
                [[tipCalculatorVC.friendsCountLabel.text should] equal:@"3"];
            });
            
            it(@"has its tip percentage label showing 15%", ^{
                [[tipCalculatorVC.tipPercentageLabel.text should] equal:@"15%"];
            });
            
            it(@"has a tip amount of $1.80", ^{
                [[tipCalculatorVC.tipAmountLabel.text should] equal:@"$1.80"];
            });
            
            it(@"has an amount per friend of $4.60", ^{
                [[tipCalculatorVC.amountPerFriendLabel.text should] equal:@"$4.60"];
            });
            
            it(@"has a total of $13.80", ^{
                [[tipCalculatorVC.totalLabel.text should] equal:@"$13.80"];
            });
        });
    });
});

SPEC_END