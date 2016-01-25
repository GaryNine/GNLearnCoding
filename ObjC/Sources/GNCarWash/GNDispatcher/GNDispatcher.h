//
//  GNDispatcher.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/24/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNEmployeeObserverProtocol.h"

@interface GNDispatcher : NSObject <GNEmployeeObserverProtocol>

- (void)addHandler:(id)handler;
- (void)removeHandler:(id)handler;

- (void)performWorkWithObject:(id)object;

@end
