#import "Kiwi.h"
#import "TipCalculator.h"

SPEC_BEGIN(TipCalculatorSpec)

describe(@"Tip Calculator", ^{
    __block TipCalculator *tipCalculator;
    beforeEach(^{
        tipCalculator = [[TipCalculator alloc] init];
    });
    
    context(@"with bill amount of $10.00, 1 friend and no tip", ^{
        beforeEach(^{
            tipCalculator.billAmountInCents = 1000;
        });
        
        it(@"has a total of $10.00", ^{
            [[theValue([tipCalculator calculateTotalInCents]) should] equal:theValue(1000)];
        });
        
        it(@"has a total tip amount of $0.00", ^{
            [[theValue([tipCalculator calculateTipAmountInCents]) should] equal:theValue(0)];
        });
        
        it(@"has an amount per friend of $10.00", ^{
            [[theValue([tipCalculator calculateAmountPerFriendInCents]) should] equal:theValue(1000)];
        });
    });
    
    context(@"with bill amount of $22.15, 1 friend and 15% tip", ^{
        beforeEach(^{
            tipCalculator.billAmountInCents = 2215;
            tipCalculator.tipPercentage = 15;
        });
        
        it(@"has a total of $25.47", ^{
            [[theValue([tipCalculator calculateTotalInCents]) should] equal:theValue(2547)];
        });
        
        it(@"has a total tip amount of $3.32", ^{
            [[theValue([tipCalculator calculateTipAmountInCents]) should] equal:theValue(332)];
        });
        
        it(@"has an amount per friend of $25.47", ^{
            [[theValue([tipCalculator calculateAmountPerFriendInCents]) should] equal:theValue(2547)];
        });
    });
    
    context(@"with bill amount of $67.80, 3 friends and 12% tip", ^{
        beforeEach(^{
            tipCalculator.billAmountInCents = 6780;
            tipCalculator.friendsCount = 3;
            tipCalculator.tipPercentage = 12;
        });
        
        it(@"has a total of $75.94", ^{
            [[theValue([tipCalculator calculateTotalInCents]) should] equal:theValue(7594)];
        });
        
        it(@"has a total tip amount of $8.14", ^{
            [[theValue([tipCalculator calculateTipAmountInCents]) should] equal:theValue(814)];
        });
        
        it(@"has an amount per friend of $25.31", ^{
            [[theValue([tipCalculator calculateAmountPerFriendInCents]) should] equal:theValue(2531)];
        });
    });
});

SPEC_END