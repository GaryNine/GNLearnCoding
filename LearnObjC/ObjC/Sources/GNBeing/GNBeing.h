//
//  GNBeing.h
//  GNLearnObjC
//
//  Created by Igor Devyatko on 11/19/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNBeingProtocol.h"
#import "GNTypeDefs.h"

@interface GNBeing : NSObject <GNBeingProtocol>

+ (instancetype)beingWithGender:(GNGenderType)gender;

- (void)addChild:(id<GNBeingProtocol>)child;
- (void)removeChild:(id<GNBeingProtocol>)child;

@end
