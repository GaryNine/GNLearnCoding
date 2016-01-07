//
//  GNEmployee.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEmployee.h"

@interface GNEmployee ()
@property (nonatomic, readwrite, assign)    NSUInteger  cash;

@end

@implementation GNEmployee

#pragma mark -
#pragma mark Public Implementations

- (void)performWorkWithObject:(id<GNCashProtocol>)object {
    
}

#pragma mark - 
#pragma mark GNCarWashProtocol

- (void)giveMoney:(NSUInteger)cash toReceiver:(id<GNCashProtocol>)receiver {
    if ([self isAbleToPayCash:cash]) {
        [receiver takeMoney:cash];
        self.cash -= cash;
    }
}

- (void)giveAllMoneyToReceiver:(id<GNCashProtocol>)receiver {
    NSUInteger money = self.cash;
    [receiver takeMoney:money];
    self.cash -= money;
}

- (void)takeMoney:(NSUInteger)cash {
    self.cash += cash;
}

- (BOOL)isAbleToPayCash:(NSUInteger)cash {
    return self.cash > cash;
}

@end
