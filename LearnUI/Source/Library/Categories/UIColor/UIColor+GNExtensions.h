//
//  UIColor+GNExtensions.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

union GNColor {
    struct {
        CGFloat red;
        CGFloat green;
        CGFloat blue;
        CGFloat alpha;
    };
    CGFloat colors[4];
};

typedef union GNColor GNColor;

extern
UIColor *UIRGBAColor(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

extern
UIColor *UIRGBColor(CGFloat red, CGFloat green, CGFloat blue);

extern
UIColor *UIColorWithGNColor(GNColor color);