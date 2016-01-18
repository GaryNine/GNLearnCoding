//
//  GNManager.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNManager.h"
#import "GNAccountant.h"

@interface GNManager ()

- (void)cleanup;

@end

@implementation GNManager

#pragma mark -
#pragma mark Public

- (void)takeProfit {
    NSLog(@"Profit is: %lu", self.cash);
    sleep(5);
}

#pragma mark -
#pragma mark Private 

- (void)processObject:(GNAccountant *)object {
    @synchronized(object) {
        [self takeProfit];
        [self cleanup];
        NSLog(@"Good Job!");
    }
}

- (void)cleanup {
    self.state = kGNEmployeeIsFree;
}

@end
