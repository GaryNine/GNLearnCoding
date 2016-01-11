//
//  GNObservableObject.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNObserverProtocol.h"

typedef NS_ENUM (NSUInteger, GNEmployeeState) {
    kGNEmployeeIsFree,
    kGNEmployeeIsWorking,
    kGNEmployeeInProcessing
};

@interface GNObservable : NSObject <GNObserverProtocol>
@property (nonatomic, readonly) NSArray         *observers;
@property (nonatomic, assign)   GNEmployeeState state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)containObserver:(id)observer;

- (void)notifyWithSelector:(SEL)selector;
- (void)notifyWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2;

@end
