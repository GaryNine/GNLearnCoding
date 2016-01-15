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
}

#pragma mark -
#pragma mark Private 

- (void)processObject:(GNAccountant *)object {
    [object giveAllMoneyToReceiver:self];
    object.state = kGNEmployeeIsFree;
    [self takeProfit];
    
    NSLog(@"Good Job!");
}

@end
