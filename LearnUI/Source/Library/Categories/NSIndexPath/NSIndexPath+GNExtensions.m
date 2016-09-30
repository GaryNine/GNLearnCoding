//
//  NSIndexPath+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/9/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSIndexPath+GNExtensions.h"

#import "UIKit/UIKit.h"

@implementation NSIndexPath (GNExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)indexPathForRow:(NSUInteger)rowIndex {
    return [self indexPathForRow:rowIndex inSection:0];
}

@end
