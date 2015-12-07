//
//  NSObject+GNExtensions.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/6/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "NSObject+GNExtensions.h"

@implementation NSObject (GNExtensions)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
