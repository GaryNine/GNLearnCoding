//
//  GNManager.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNManager.h"
#import "GNAccountant.h"

@implementation GNManager

#pragma mark -
#pragma mark Public Implementations

- (void)toProfit {
    NSLog(@"Profit is: %lu", self.cash);
}

#pragma mark -
#pragma mark Private Implementations

- (void)performWorkWithObject:(id<GNCashProtocol>)object {
    [object giveAllMoneyToReceiver:self];
    [self toProfit];
}

@end
