//
//  GNHypnoView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GNVoidBlock)(void);

typedef NS_ENUM(NSUInteger, GNSquarePosition) {
    GNSquarePositionTopLeft,
    GNSquarePositionBottomLeft,
    GNSquarePositionBottomRight,
    GNSquarePositionTopRight,
    GNSquarePositionCount
};

@interface GNSquareView : UIView
@property (nonatomic, strong)   IBOutlet UIButton   *nextButton;
@property (nonatomic, strong)   IBOutlet UIButton   *animateButton;
@property (nonatomic, strong)   IBOutlet UILabel    *squareLabel;
@property (nonatomic, strong)   IBOutlet UIView     *squareAreaView;

@property (nonatomic, assign, getter=isCycleStoped) BOOL    cycleStarted;

@property (nonatomic, assign)   GNSquarePosition    squarePosition;

- (void)setSquarePosition:(GNSquarePosition)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(GNSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(GNVoidBlock)handler;

- (void)moveSquareToNextPosition;

@end
