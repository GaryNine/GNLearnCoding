//
//  GNLoadingView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNLoadingView.h"

#import "GNBlockCallMacro.h"
#import "UINib+GNExtensions.h"

static const NSTimeInterval kGNAnimationDuration = 0.4;

static const CGFloat    kGNVisibleAlpha = 1.0;
static const CGFloat    kGNHiddenAlpha = 0;

@implementation GNLoadingView

@synthesize visible = _visible;

#pragma mark -
#pragma mark Class Methods

+ (id)loadingViewInSuperview:(UIView *)superView {
    GNLoadingView *loadingView = [UINib objectWithClass:[self class]];
    loadingView.alpha = kGNHiddenAlpha;
    loadingView.frame = superView.bounds;
    loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [superView addSubview:loadingView];
    
    return loadingView;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:NO];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated completionHandler:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated completionHandler:(GNVoidBlock)handler {
    if (_visible != visible) {
        [UIView animateWithDuration:animated ? kGNAnimationDuration : 0
                         animations:^{
                             self.alpha = visible ? kGNVisibleAlpha : kGNHiddenAlpha;
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 _visible = visible;
                                 
                                 if (!visible) {
                                     [self removeFromSuperview];
                                 }
                                 
                                 GNBlockCall(handler);
                             }
                         }];
    }
}

@end
