//
//  GNRoom.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEnterprise.h"

@class GNContainer;

@interface GNRoom : NSObject
@property (nonatomic, readonly) NSSet   *employees;

+ (instancetype)room;
+ (instancetype)roomWithCapacity:(NSUInteger)capacity;

- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addEmployee:(id)employee;
- (void)removeEmployee:(id)employee;

- (BOOL)isFullOfEmployees;

@end
