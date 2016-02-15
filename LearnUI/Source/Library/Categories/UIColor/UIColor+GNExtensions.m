//
//  UIColor+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "UIColor+GNExtensions.h"

#pragma mark -
#pragma mark Public

UIColor *UIRGBAColor(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

UIColor *UIRGBColor(CGFloat red, CGFloat green, CGFloat blue) {
    return UIRGBAColor(red, green, blue, 1.0);
}

UIColor *UIColorWithGNColor(GNColor color) {
    return UIRGBAColor(color.red, color.green, color.blue, color.alpha);
}
