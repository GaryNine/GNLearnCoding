//
//  GNEnterprise.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GNCar;
@class GNCarWash;
@class GNBuilding;

@interface GNEnterprise : NSObject
@property (nonatomic, retain, readonly) NSSet   *buildings;
@property (nonatomic, retain, readonly) NSSet   *employees;

+ (instancetype)enterprise;
+ (instancetype)enterpriseWithCarWash:(GNCarWash *)carWash office:(GNBuilding *)officeBlock;

- (instancetype)initWithCarWash:(GNCarWash *)carWash office:(GNBuilding *)officeBlock;

- (void)addBuilding:(id)building;
- (void)removeBuilding:(id)building;

- (void)hireEmployee:(id)employee;
- (void)kickOutEmployee:(id)employee;

- (void)washCar:(GNCar *)car;

@end
