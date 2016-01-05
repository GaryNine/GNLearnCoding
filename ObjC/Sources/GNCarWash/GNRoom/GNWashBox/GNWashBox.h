//
//  GNWashBox.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNRoom.h"

@class GNCar;

@interface GNWashBox : GNRoom
@property (nonatomic, readonly) NSSet   *cars;
@property (nonatomic, readonly) BOOL    ableToContainCars;
//@property (nonatomic, readonly, getter=isFullOfCars)    BOOL    fullOfCars;

- (void)addCar:(GNCar *)car;
- (void)removeCar:(GNCar *)car;

- (BOOL)isFullOfCars;

@end
