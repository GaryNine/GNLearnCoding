//
//  GNEmployee.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNObservableObject.h"
#import "GNCashProtocol.h"
#import "GNEmployeeObserverProtocol.h"

typedef NS_ENUM (NSUInteger, GNEmployeeState) {
    kGNEmployeeIsFree,
    kGNEmployeeIsWorking,
    kGNEmployeeNeedProcessing
};

@interface GNEmployee : GNObservableObject <GNCashProtocol, GNEmployeeObserverProtocol>

- (void)performWorkWithObject:(id<GNCashProtocol>)object;

@end
