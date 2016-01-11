//
//  GNCar.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/7/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNCar.h"

static const NSUInteger kGNInitialCash = 1000;

@interface GNCar()
@property (nonatomic, readwrite, assign)    NSUInteger  cash;

@end

@implementation GNCar

#pragma mark -
#pragma mark Class Methods

+ (instancetype)car {
    return [[[self alloc] initWithCash:kGNInitialCash] autorelease];
}

+ (instancetype)carWithCash:(NSUInteger)cash {
    return [[self alloc] initWithCash:cash];
}

#pragma mark -
#pragma mark Initialization & Deallocation

- (instancetype)initWithCash:(NSUInteger)cash {
    self = [self init];
    
    if (self) {
        self.cash = cash;
    }
    
    return self;
}

#pragma mark - 
#pragma mark GNCarWashProtocol

- (void)giveMoney:(NSUInteger)cash {
    self.cash -= cash;
}

- (void)takeMoney:(NSUInteger)cash {
    self.cash += cash;
}

- (void)giveMoney:(NSUInteger)cash toReceiver:(id<GNCashProtocol>)receiver {
    [self giveMoney:cash];
    [receiver takeMoney:cash];
}

@end
