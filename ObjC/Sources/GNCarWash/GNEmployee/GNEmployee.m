//
//  GNEmployee.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEmployee.h"

#import "GNWasherman.h"
#import "GNAccountant.h"
#import "GNManager.h"

@interface GNEmployee ()
@property (nonatomic, readwrite, assign)    NSUInteger  cash;

@end

@implementation GNEmployee

#pragma mark -
#pragma mark Initializations & Deallocation

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.state = kGNEmployeeIsFree;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementations

- (void)performWorkWithObject:(id<GNCashProtocol>)object {
    [self doesNotRecognizeSelector:_cmd];
}

#pragma mark - 
#pragma mark GNCashProtocol

- (void)giveMoney:(NSUInteger)cash {
    self.cash -= cash;
}

- (void)takeMoney:(NSUInteger)cash {
    self.cash += cash;
}

- (void)giveAllMoneyToReceiver:(id<GNCashProtocol>)receiver {
    NSUInteger allCash = self.cash;
    [self giveMoney:allCash];
    [receiver takeMoney:allCash];
}

#pragma mark -
#pragma mark GNObserverProtocol

- (void)employeeDidBecomeProcessing:(id)employee {
    [self performWorkWithObject:employee];
}

@end
