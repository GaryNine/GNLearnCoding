//
//  GNObservableObject.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNObservableObject.h"

@interface GNObservableObject ()
@property (nonatomic, readwrite)    NSHashTable *observersHashTable;

- (void)setState:(NSUInteger)state;
- (SEL)selectorForState:(NSUInteger)state;

@end

@implementation GNObservableObject

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
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    return [[self.observersHashTable copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    if (state != _state) {
        _state = state;
        
        [self notifyWithSelector:[self selectorForState:state] withObject:object];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    if (![self containObserver:observer]) {
        [self.observersHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    [self.observersHashTable removeObject:observer];
}

- (BOOL)containObserver:(id)observer {
    return [self.observersHashTable containsObject:observer];
}

- (void)notifyWithSelector:(SEL)selector {
    [self notifyWithSelector:selector withObject:nil];
}

- (void)notifyWithSelector:(SEL)selector withObject:(id)object {
    NSArray *observers = self.observers;
    
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

@end
