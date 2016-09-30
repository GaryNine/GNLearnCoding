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
@property (nonatomic, retain)   NSHashTable *observersHashTable;

@property (nonatomic, assign, getter=isNotificationEnabled) BOOL    notificationEnabled;

- (void)notify:(BOOL)notificationState whenPerformingBlock:(void(^)(void))block;

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
        self.notificationEnabled = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    NSHashTable *observersHashTable = self.observersHashTable;
    @synchronized(observersHashTable) {
        return [observersHashTable allObjects];
    }
    
    return nil;
}

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        if (state != _state) {
            _state = state;
            
            [self notifyWithSelector:[self selectorForState:state] withObject:object];
        }
    }
}

#pragma mark -
#pragma mark Public

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)addObserver:(id)observer {
    NSHashTable *observersHashTable = self.observersHashTable;
    @synchronized(observersHashTable) {
        if (![observersHashTable containsObject:observer]) {
            [observersHashTable addObject:observer];
        }
    }
}

- (void)removeObserver:(id)observer {
    NSHashTable *observersHashTable = self.observersHashTable;
    @synchronized(observersHashTable) {
        [observersHashTable removeObject:observer];
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
    NSHashTable *observersHashTable = self.observersHashTable;
    @synchronized(observersHashTable) {
        return [observersHashTable containsObject:observer];
    }
}

- (void)notifyWithSelector:(SEL)selector {
    [self notifyWithSelector:selector withObject:nil];
}

- (void)notifyWithSelector:(SEL)selector withObject:(id)object {
    @synchronized(self) {
        if (!self.notificationEnabled) {
            return;
        }
        
        NSArray *observers = self.observers;
        
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                GNClangDiagnosticPushOptionPerformSelectorLeakWarning
                [observer performSelector:selector withObject:self withObject:object];
                GNClangDiagnosticPopOption
            }
        }
    }
}

- (void)performBlockWithNotifications:(void (^)(void))block {
    [self notify:YES whenPerformingBlock:block];
}

- (void)performBlockWithoutNotifications:(void (^)(void))block {
    [self notify:NO whenPerformingBlock:block];
}

#pragma mark -
#pragma mark Private

- (void)notify:(BOOL)shouldNotify whenPerformingBlock:(void (^)(void))block {
    if (!block) {
        return;
    }
    
    @synchronized(self) {
            BOOL notificationEnabled = self.notificationEnabled;
            self.notificationEnabled = shouldNotify;
            block();
            
            self.notificationEnabled = notificationEnabled;
    }
}

@end
