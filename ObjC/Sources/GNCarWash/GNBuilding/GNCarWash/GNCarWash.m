//
//  GNCarWash.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNCarWash.h"
#import "GNWashBox.h"

@implementation GNCarWash

+ (instancetype)building {
    return [[[super alloc] initWithRoom:[GNWashBox room]] autorelease];
}

+ (instancetype)buildingWithRoom:(GNWashBox *)room {
    return [[[super alloc] initWithRoom:room] autorelease];
}

@end
