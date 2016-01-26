//
//  GNDispatcher.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/24/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNDispatcher.h"

#import "GNQueue.h"
#import "GNEmployee.h"

@interface GNDispatcher ()
@property (nonatomic, retain)   GNQueue         *processingQueue;
@property (nonatomic, retain)   NSMutableArray  *mutableHandlers;

- (void)performWork;
- (id)reserveFreeHandler;

@end

@implementation GNDispatcher

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.processingQueue = nil;
    [self removeAllHandlers];
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.processingQueue = [GNQueue object];
        self.mutableHandlers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(id)handler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers) {
        [handlers addObject:handler];
        [handler addObserver:self];
    }
}

- (void)removeHandler:(id)handler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers) {
        [handlers removeObject:handler];
        [handler removeObserver:self];
    }
}

- (void)removeAllHandlers {
    NSMutableArray *handlers = self.mutableHandlers;
    for (id handler in handlers) {
        [handler removeObserver:self];
        
        self.mutableHandlers = nil;
    }
}

- (BOOL)containsHandler:(id)handler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers) {
        return [handlers containsObject:handler];
    }
}

- (void)performWorkWithObject:(id)object {
    [self.processingQueue enqueueObject:object];
    [self performWork];
}

#pragma mark -
#pragma mark Private

- (void)performWork {
    id object = [self.processingQueue dequeueObject];
    if (object) {
        id handler = [self reserveFreeHandler];
        if (handler) {
            [handler performWorkWithObject:object];
        } else {
            [self.processingQueue enqueueObject:object];
        }
    }
}

- (id)reserveFreeHandler {
    NSMutableArray *handlers = self.mutableHandlers;
    for (GNEmployee *handler in handlers) {
        @synchronized(handler) {
            if (kGNEmployeeIsFree == handler.state) {
                handler.state = kGNEmployeeIsWorking;
                return handler;
            }
        }
    }
    
    return nil;
}

- (void)employeeDidBecomeFree:(id)employee {
    [self performWork];
}

@end
