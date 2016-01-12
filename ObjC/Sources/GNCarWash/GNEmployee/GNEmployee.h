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

typedef NS_ENUM (NSUInteger, GNEmployeeState) {
    kGNEmployeeIsFree,
    kGNEmployeeIsWorking,
    kGNEmployeeInProcessing
};

@interface GNEmployee : GNObservableObject <GNCashProtocol>

- (void)performWorkWithObject:(id<GNCashProtocol>)object;

@end
