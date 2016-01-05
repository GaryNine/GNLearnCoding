//
//  GNEmployee.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEnterprise.h"

#import "GNCashProtocol.h"

@interface GNEmployee : NSObject <GNCashProtocol>

@property (nonatomic, readonly) NSUInteger  salary;
@property (nonatomic, readonly) NSUInteger  experience;

+ (instancetype)employee;
+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience;

- (void)performWorkWithObject:(id<GNCashProtocol>)object;

@end
