//
//  GNObservableObject.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNObservableObject : NSObject
@property (nonatomic, readonly) NSArray     *observers;
@property (nonatomic, assign)   NSUInteger  state;

- (void)setState:(NSUInteger)state withObject:(id)object;

// This method is intended for subclassing.Never call it directly.
- (SEL)selectorForState:(NSUInteger)state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)addObserversFromArray:(NSArray *)array;
- (void)removeObserversFromArray:(NSArray *)array;

- (BOOL)containsObserver:(id)observer;

- (void)notifyOfState:(NSUInteger)state;
- (void)notifyOfState:(NSUInteger)state withObject:(id)object;

- (void)performBlockWithNotifications:(void (^)(void))block;
- (void)performBlockWithoutNotifications:(void (^)(void))block;

@end
