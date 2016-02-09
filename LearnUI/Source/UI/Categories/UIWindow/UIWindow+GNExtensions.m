//
//  UIWindow+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "UIWindow+GNExtensions.h"

@implementation UIWindow (GNExtensions)

+ (UIWindow *)window {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
