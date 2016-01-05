//
//  GNBuilding.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEnterprise.h"

@class GNRoom;

@interface GNBuilding : NSObject
@property (nonatomic, readonly) NSSet   *rooms;

+ (instancetype)building;
+ (instancetype)buildingWithRoom:(id)room;

- (instancetype)initWithRoom:(id)room;

- (void)addRoom:(id)room;
- (void)removeRoom:(id)room;

@end
