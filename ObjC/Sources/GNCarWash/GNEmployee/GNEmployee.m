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

- (void)processObject:(id)object;
- (void)cleanup;

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
#pragma mark Public

- (void)performWorkWithObject:(id<GNCashProtocol>)object {
    self.state = kGNEmployeeIsWorking;
    
    [self processObject:object];
    [self cleanup];
}

#pragma mark -
#pragma mark Private 

- (void)processObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)cleanup {
    self.state = kGNEmployeeNeedProcessing;
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kGNEmployeeIsFree:
            return @selector(employeeDidBecomeFree:);
            
        case kGNEmployeeIsWorking:
            return @selector(employeeDidBecomeWork:);
            
        case kGNEmployeeNeedProcessing:
            return @selector(employeeDidBecomeFinish:);
            
        default:
            return NULL;
    }
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

- (void)employeeDidBecomeFinish:(id)employee {
    [self performWorkWithObject:employee];
}

@end
