//
//  GNHypnoView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

// добавить updateStartStopButton

#import "GNSquareView.h"

#import "CGGeometry+GNExtensions.h"
#import "UIColor+GNExtensions.h"
#import "GNOwnershipMacro.h"
#import "GNBlockCallMacro.h"

static const NSTimeInterval kGNAnimationDuration = 0.4;

static NSString * const kGNButtonStart = @"START";
static NSString * const kGNButtonStop  = @"STOP";

const GNColor kGNRedColor = {210, 42, 70, 1.0};
const GNColor kGNGreenColor = {87, 194, 70, 1.0};

@interface GNSquareView ()
@property (nonatomic, assign, getter=isAnimating)   BOOL    animating;

- (GNSquarePosition)nextPositionWithSquarePosition:(GNSquarePosition)position;
- (CGRect)squareFrameWithSquarePosition:(GNSquarePosition)position;

- (void)setAnimateButtonWithColor:(UIColor *)color title:(NSString *)title;
- (void)updateAnimateButton;

@end

@implementation GNSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(GNSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setCycleStarted:(BOOL)cycleStarted {
    if (_cycleStarted != cycleStarted) {
        _cycleStarted = cycleStarted;
    }
    
    [self updateAnimateButton];
    if (_cycleStarted == YES) {
        [self moveSquareToNextPosition];
    }
}

- (void)setAnimateButtonWithColor:(UIColor *)color title:(NSString *)title {
    UIButton *animateButton = self.animateButton;
    animateButton.backgroundColor = color;
    [animateButton setTitle:title forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark Public

- (void)setSquarePosition:(GNSquarePosition)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(GNSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(GNVoidBlock)handler {
    
    if (_squarePosition != squarePosition && self.animating != animated) {
        self.animating = YES;
        [UIView animateWithDuration:kGNAnimationDuration
                         animations:^{
                             self.squareLabel.frame = [self squareFrameWithSquarePosition:squarePosition];
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 self.animating = NO;
                                 _squarePosition = squarePosition;
                                 
                                 GNBlockCall(handler);
                             }
                         }];
    }
}

- (void)moveSquareToNextPosition {
    GNWeakify(self);
        [self setSquarePosition:[self nextPositionWithSquarePosition:self.squarePosition]
                       animated:YES
              completionHandler:^ {
                  GNStrongifyAndReturnIfNil(self)
                  if (self.cycleStarted) {
                      [self moveSquareToNextPosition];
                  }
              }];
}

#pragma mark -
#pragma mark Private

- (GNSquarePosition)nextPositionWithSquarePosition:(GNSquarePosition)position {
    return (position + 1) % GNSquarePositionCount;
}

- (CGRect)squareFrameWithSquarePosition:(GNSquarePosition)position {
    CGRect squareFrame = self.squareLabel.frame;
    CGRect bounds = self.squareAreaView.bounds;

    CGPoint origin = CGPointZero;
    CGPoint bottomRightPoint = GNBottomRightCornerOriginPoint(bounds, squareFrame);
    
    switch (position) {
        case GNSquarePositionBottomLeft:
            origin.y = bottomRightPoint.y;
            break;
            
        case GNSquarePositionBottomRight:
            origin = bottomRightPoint;
            break;
            
        case GNSquarePositionTopRight:
            origin.x = bottomRightPoint.x;
            break;
            
        default:
            break;
    }
    
    squareFrame.origin = origin;
    
    return squareFrame;
}

- (void)updateAnimateButton {
    BOOL cycleStarted = self.cycleStarted;
    UIColor *buttonColor = (cycleStarted) ? UIColorWithGNColor(kGNRedColor) : UIColorWithGNColor(kGNGreenColor);
    NSString *buttonTitle = (cycleStarted) ? kGNButtonStop : kGNButtonStart;
    
    [self setAnimateButtonWithColor:buttonColor title:buttonTitle];
    
}

@end
