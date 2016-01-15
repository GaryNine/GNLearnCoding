//
//  GNObservableObject.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

// изменить название на observableObject

#import <Foundation/Foundation.h>

#import "GNObserverProtocol.h"

@interface GNObservableObject : NSObject <GNObserverProtocol>
@property (nonatomic, readonly) NSArray     *observers;
@property (nonatomic, assign)   NSUInteger  state;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)containObserver:(id)observer;

- (void)notifyWithSelector:(SEL)selector;
- (void)notifyWithSelector:(SEL)selector withObject:(id)object;

@end
