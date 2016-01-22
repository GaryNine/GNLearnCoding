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

#import "GNQueue.h"

@interface GNEmployee ()
@property (nonatomic, readwrite, assign)    NSUInteger  cash;
@property (nonatomic, retain)               GNQueue     *processingQueue;

- (void)processObject:(id)object;
- (void)cleanupAfterProcessing;
- (void)finishWithObject:(id)object;

- (void)performBackgroundWorkWithObject:(id)object;

@end

@implementation GNEmployee

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.processingQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kGNEmployeeIsFree;
        self.processingQueue = [GNQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id<GNCashProtocol>)object {
    @synchronized(self) {
        if (self.state == kGNEmployeeIsFree) {
            self.state = kGNEmployeeIsWorking;
            [self performSelectorInBackground:@selector(performBackgroundWorkWithObject:) withObject:object];
        } else {
            [self.processingQueue enqueueObject:object];
        }
    }
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
    id nextCar = [self.processingQueue dequeueObject];
    if (nextCar) {
        [self performSelectorInBackground:@selector(performBackgroundWorkWithObject:) withObject:nextCar];
    } else {
        [self cleanupAfterProcessing];
        [self finishWithObject:object];
    }
}

- (void)cleanupAfterProcessing {
    self.state = kGNEmployeeNeedProcessing;
}

- (void)finishWithObject:(GNEmployee *)object {
    object.state = kGNEmployeeIsFree;
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
