//
//  GNHypnoView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNSquareView.h"

@interface GNSquareView ()
@property (nonatomic, assign, getter=isAnimating)   BOOL    animating;

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
        self.squareView.frame = [self squareFrameWithSquarePosition:squarePosition];
        
        _squarePosition = squarePosition;
    }
}

- (void)moveSquareToNextPosition {
    [self setSquarePosition:[self nextPositionWithSquarePosition:self.squarePosition]];
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
    CGPoint bottomRiightPoint = CGPointMake(CGRectGetMaxX(bounds) - CGRectGetWidth(squareFrame),
                                            CGRectGetMaxY(bounds) - CGRectGetHeight(squareFrame));

    switch (position) {
        case GNSquarePositionBottomLeft:
            origin.y = bottomRiightPoint.y;
            break;
            
        case GNSquarePositionBottomRight:
            origin = bottomRiightPoint;
            break;
            
        case GNSquarePositionTopRight:
            origin.x = bottomRiightPoint.x;
            break;
            
        default:
            break;
    }
    
    squareFrame.origin = origin;
    
    return squareFrame;
}

@end
