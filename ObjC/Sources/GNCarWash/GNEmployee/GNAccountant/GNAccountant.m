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
#pragma mark Public

- (void)countMoney {
    NSLog(@"Money count is: %lu", self.cash);
    sleep(1);
}

#pragma mark -
#pragma mark Private 

- (void)processObject:(GNWasherman *)object {
    [object giveAllMoneyToReceiver:self];
    [self countMoney];
}

@end
