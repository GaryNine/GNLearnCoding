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

- (void)performWorkWithObject:(GNAccountant *)object {
    [object giveAllMoneyToReceiver:self];
}

- (void)takeTheProfit {
    NSLog(@"Money don't smell  %@",self);
}

@end
