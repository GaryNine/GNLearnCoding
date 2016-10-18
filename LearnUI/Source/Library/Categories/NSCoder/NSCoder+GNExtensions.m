//
//  NSCoder+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSCoder+GNExtensions.h"

@implementation NSCoder (GNExtensions)

- (void)encodeObjects:(NSDictionary *)objects {
    for (id key in objects) {
        [self encodeObject:[objects objectForKey:key] forKey:key];
    }
}

@end
