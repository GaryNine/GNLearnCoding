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
@property (nonatomic, strong)   IBOutlet UIButton   *startButton;

@property (nonatomic, strong)   IBOutlet UILabel    *squareView;
@property (nonatomic, assign)   GNSquarePosition    squarePosition;

- (void)setSquarePosition:(GNSquarePosition)squarePosition animated:(BOOL)animated;
- (void)setSquarePosition:(GNSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(GNVoidBlock)handler;

- (void)moveSquareToNextPosition;

@end
