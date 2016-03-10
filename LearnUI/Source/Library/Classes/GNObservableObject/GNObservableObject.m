//
//  GNObservableObject.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNObservableObject.h"

#import "GNClangMacro.h"

@interface GNObservableObject ()
@property (nonatomic, retain)    NSHashTable *observersHashTable;

@end

@implementation GNObservableObject

@dynamic observers;

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.observersHashTable = nil;
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
    @synchronized(self) {
        return [self.observersHashTable copy];
    }
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

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)addObserver:(id)observer {
    @synchronized(self) {
        if (![self containsObserver:observer]) {
            [self.observersHashTable addObject:observer];
        }
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
        [self.observersHashTable removeObject:observer];
    }
}

- (void)addObserversFromArray:(NSArray *)array {
    for (id observer in array) {
        [self addObserver:observer];
    }
}

- (void)removeObserversFromArray:(NSArray *)array {
    for (id observer in array) {
        [self removeObserver:observer];
    }
}

- (BOOL)containsObserver:(id)observer {
    NSHashTable *observers = self.observersHashTable;
    @synchronized(observers) {
        return [self.observersHashTable containsObject:observer];
    }
}

- (void)notifyWithSelector:(SEL)selector {
    [self notifyWithSelector:selector withObject:nil];
}

- (void)notifyWithSelector:(SEL)selector withObject:(id)object {
    NSArray *observers = self.observers;
    
    for (id observer in observers) {
        if ([observer respondsToSelector:selector]) {
            GNClangDiagnosticPushOptionPerformSelectorLeakWarning
            [observer performSelector:selector withObject:self withObject:object];
            GNClangDiagnosticPopOption
        }
    }
}

- (void)performBlockWithNotifications:(void (^)(void))block {
    
}

- (void)performBlockWithoutNotifications:(void (^)(void))block {
    
}

@end
