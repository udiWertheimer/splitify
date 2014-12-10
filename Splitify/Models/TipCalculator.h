//
//  TipCalculator.h
//  Splitify
//
//  Created by Udi on 12/10/14.
//  Copyright (c) 2014 IIC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipCalculator : NSObject

@property (nonatomic) NSUInteger tipPercentage;
@property (nonatomic) NSUInteger friendsCount;
@property (nonatomic) NSUInteger billAmountInCents;

- (NSUInteger)calculateTotalInCents;
- (NSUInteger)calculateTipAmountInCents;
- (NSUInteger)calculateAmountPerFriendInCents;

@end
