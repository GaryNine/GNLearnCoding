//
//  CGGeometry+GNExtensions.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CGMinX(frame) CGRectGetMinX(frame)
#define CGMinY(frame) CGRectGetMinY(frame)

#define CGMidX(frame) CGRectGetMidX(frame)
#define CGMidY(frame) CGRectGetMidy(frame)

#define CGMaxX(frame) CGRectGetMaxX(frame)
#define CGMaxY(frame) CGRectGetMaxY(frame)

#define CGHeight(frame) CGRectGetHeight(frame)
#define CGWidth(frame) CGRectGetWidth(frame)

static inline
CGPoint GNBottomRightCornerOriginPoint(CGRect bounds, CGRect frame) {
    return CGPointMake(CGMaxX(bounds) - CGWidth(frame),
                       CGMaxY(bounds) - CGHeight(frame));
}
