//
//  TipCalculator.m
//  Splitify
//
//  Created by Udi on 12/10/14.
//  Copyright (c) 2014 IIC. All rights reserved.
//

#import "TipCalculator.h"

@implementation TipCalculator

- (NSUInteger) friendsCount
{
    if (!_friendsCount) _friendsCount = 1;
    return _friendsCount;
}

- (NSUInteger) calculateTipAmountInCents
{
    return (NSUInteger)round((self.tipPercentage / 100.0) * self.billAmountInCents);
}

- (NSUInteger) calculateTotalInCents
{
    return self.billAmountInCents + [self calculateTipAmountInCents];
}

- (NSUInteger) calculateAmountPerFriendInCents
{
    return (NSUInteger)round([self calculateTotalInCents] / (float)self.friendsCount);
}

@end