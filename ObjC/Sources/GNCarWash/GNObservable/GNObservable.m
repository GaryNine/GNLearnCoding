//
//  GNObservableObject.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNObservable.h"

@interface GNObservable ()
@property (nonatomic, readwrite)    NSHashTable *observersHashTable;

- (void)setState:(GNEmployeeState)state;
- (SEL)selectorForState:(GNEmployeeState)state;

@end

@implementation GNObservable

@dynamic observers;

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.observersHashTable = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersHashTable = [NSHashTable object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    return [[self.observersHashTable copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addObserver:(id)observer {
    if (![self containObserver:observer]) {
        [self.observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(NSObject *)observer {
    [self.observersHashTable removeObject:observer];
}

- (BOOL)containObserver:(id)observer {
    return [self.observersHashTable containsObject:observer];
}

- (void)notifyWithSelector:(SEL)selector {
    [self notifyWithSelector:selector withObject:nil];
}

- (void)notifyWithSelector:(SEL)selector withObject:(id)object {
    [self notifyWithSelector:selector withObject:object withObject:nil];
}

- (void)notifyWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2 {
    NSArray *observers = self.observers;
    
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:object withObject:object2];
        }
    }
}

#pragma mark -
#pragma mark Private Implementations

- (void)setState:(GNEmployeeState)state {
    if (state != _state) {
        _state = state;
        
        [self notifyWithSelector:[self selectorForState:state] withObject:self];
    }
}

- (SEL)selectorForState:(GNEmployeeState)state {
    switch (state) {
        case kGNEmployeeIsFree:
            return @selector(employeeDidBecomeFree:);
            
        case kGNEmployeeIsWorking:
            return @selector(employeeDidBecomeWork:);
            
        case kGNEmployeeInProcessing:
            return @selector(employeeDidBecomeProcessing:);
            
        default:
            return NULL;
    }
}

@end
