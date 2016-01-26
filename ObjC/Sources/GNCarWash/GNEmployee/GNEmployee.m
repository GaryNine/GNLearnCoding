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
@property (nonatomic, readwrite)    NSUInteger  cash;

- (void)processObject:(id)object;
- (void)cleanupAfterProcessing;
- (void)finishWithObject:(id)object;

- (void)performBackgroundWorkWithObject:(id)object;

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
    [self performSelectorInBackground:@selector(performBackgroundWorkWithObject:) withObject:object];
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundWorkWithObject:(id)object {
    [self processObject:object];
    [self performSelectorOnMainThread:@selector(performWorkOnMainThreadWithObject:) withObject:object waitUntilDone:NO];
}

- (void)processObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)performWorkOnMainThreadWithObject:(id)object {
    [self finishWithObject:object];
    [self cleanupAfterProcessing];
}

- (void)cleanupAfterProcessing {
    @synchronized(self) {
        self.state = kGNEmployeeNeedProcessing;
    }
}

- (void)finishWithObject:(GNEmployee *)object {
    @synchronized(object) {
        object.state = kGNEmployeeIsFree;
    }
}

#pragma mark -
#pragma mark GNObsevableObject

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
    @synchronized(self) {
        self.cash -= cash;
    }
}

- (void)takeMoney:(NSUInteger)cash {
    @synchronized(self) {
        self.cash += cash;
    }
}

- (void)giveAllMoneyToReceiver:(id<GNCashProtocol>)receiver {
    @synchronized(self) {
        NSUInteger allCash = self.cash;
        [self giveMoney:allCash];
        [receiver takeMoney:allCash];
    }
}

@end
