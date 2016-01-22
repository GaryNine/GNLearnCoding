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
#pragma mark Public

- (void)takeProfit {
    NSLog(@"Profit is: %lu", self.cash);
    sleep(2);
}

#pragma mark -
#pragma mark Private 

- (void)processObject:(GNAccountant *)object {
    [object giveAllMoneyToReceiver:self];
    [self takeProfit];
    NSLog(@"Good Job!");
}

- (void)cleanupAfterProcessing {
    self.state = kGNEmployeeIsFree;
}

@end
