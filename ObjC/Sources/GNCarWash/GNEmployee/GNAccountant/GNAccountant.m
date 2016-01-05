//
//  GNAccountant.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNAccountant.h"
#import "GNWasherman.h"
#import "GNCashProtocol.h"

@interface GNAccountant ()
@property (nonatomic, readwrite, assign)    NSUInteger  cash;

@end

@implementation GNAccountant
@synthesize cash = _cash;

#pragma mark -
#pragma mark Public Implementations

- (void)countMoney {
    
}

- (void)performWorkWithObject:(GNWasherman *)object {
    [object giveAllMoneyToReceiver:self];
}

#pragma mark -
#pragma mark GNCashProtocol

- (void)giveMoney:(NSUInteger)cash toReceiver:(id<GNCashProtocol>)receiver {
    [receiver takeMoney:cash];
    self.cash -= cash;
}

- (void)giveAllMoneyToReceiver:(id<GNCashProtocol>)receiver {
    NSUInteger money = self.cash;
    [receiver takeMoney:money];
    self.cash -= money;
}

- (void)takeMoney:(NSUInteger)cash {
    self.cash += cash;
}

@end
