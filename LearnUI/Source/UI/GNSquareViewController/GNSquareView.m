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

static const NSTimeInterval kGNAnimationDuration = 0.4;

@interface GNSquareView ()
@property (nonatomic, assign, getter=isAnimating)   BOOL    animating;
@property (nonatomic, assign, getter=isCycleStoped) BOOL    cycleStoped;

- (GNSquarePosition)nextPositionWithSquarePosition:(GNSquarePosition)position;
- (CGRect)squareFrameWithSquarePosition:(GNSquarePosition)position;

@end

@implementation GNSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(GNSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

#pragma mark -
#pragma mark Public

- (void)setSquarePosition:(GNSquarePosition)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(GNSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(GNVoidBlock)handler {
    
    if (_squarePosition != squarePosition) {
        self.animating = YES;
        [UIView animateWithDuration:kGNAnimationDuration
                         animations:^{
                             self.squareView.frame = [self squareFrameWithSquarePosition:squarePosition];
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 self.animating = NO;
                                 _squarePosition = squarePosition;
                                 
                                 [self moveSquareToNextPosition];
                             }
                         }];
    }
}

- (void)moveSquareToNextPosition {
        [self setSquarePosition:[self nextPositionWithSquarePosition:self.squarePosition]
                       animated:YES
              completionHandler:^ {
                  
              }];
}

#pragma mark -
#pragma mark Private

- (GNSquarePosition)nextPositionWithSquarePosition:(GNSquarePosition)position {
    return (position + 1) % GNSquarePositionCount;
}

- (CGRect)squareFrameWithSquarePosition:(GNSquarePosition)position {
    CGRect squareFrame = self.squareView.frame;
    CGRect bounds = self.bounds;

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

@end
