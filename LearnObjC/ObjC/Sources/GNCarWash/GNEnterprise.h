//
//  GNEnterprise.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GNCar;

@interface GNEnterprise : NSObject

- (void)washCar:(GNCar *)car;
- (void)washCars:(NSArray *)cars;

@end
