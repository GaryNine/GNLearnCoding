//
//  GNBeing.h
//  GNLearnObjC
//
//  Created by Igor Devyatko on 11/19/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNBeing : NSObject
typedef enum GNGender GNGender;
@property  NSString    *name;
@property  NSNumber    *weight;
@property  NSNumber    *age;
@property  NSArray     *children;

+ (void)GNBeingLetFight;
+ (void)GNBeingCreateChild:(GNBeing*)child;
+ (void)GNBeingAddChild:(GNBeing*)child;
+ (void)GNBeingRemoveChild:(GNBeing*)child;
+ (void)GNBeingSayHello;

@end
