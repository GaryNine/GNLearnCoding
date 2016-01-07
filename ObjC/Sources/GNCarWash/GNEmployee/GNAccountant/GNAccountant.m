//
//  GNAccountant.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNAccountant.h"
#import "GNWasherman.h"

@implementation GNAccountant

#pragma mark -
#pragma mark Public Implementations

- (void)countMoney {
    NSLog(@"Money count is: %lu", self.cash);
}

#pragma mark -
#pragma mark Private Implementations

- (void)performWorkWithObject:(id<GNCashProtocol>)object {
    [object giveAllMoneyToReceiver:self];
    [self countMoney];
}

@end
