//
//  GNObservableObject.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNEmployeeObserverProtocol.h"

@interface GNObservableObject : NSObject
@property (nonatomic, readonly) NSArray     *observers;
@property (nonatomic, assign)   NSUInteger  state;

- (void)setState:(NSUInteger)state withObject:(id)object;
- (SEL)selectorForState:(NSUInteger)state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)addObserversFromArray:(NSArray *)array;
- (void)removeObserversFromArray:(NSArray *)array;

- (BOOL)containsObserver:(id)observer;

- (void)notifyWithSelector:(SEL)selector;
- (void)notifyWithSelector:(SEL)selector withObject:(id)object;

@end
