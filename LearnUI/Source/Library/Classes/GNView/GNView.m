//
//  GNView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/12/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNView.h"

#import "GNLoadingView.h"

@implementation GNView

@dynamic loadingViewVisible;

#pragma mark - 
#pragma mark Initializations & Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.loadingView = [self spinnerView];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        self.loadingView = [self spinnerView];
    }
}

#pragma mark -
#pragma mark Accessors

- (void)setLoadingView:(UIView<GNSpinnerView> *)loadingView {
    if (_loadingView != loadingView) {
        [loadingView removeFromSuperview];
        _loadingView = loadingView;
        [self addSubview:loadingView];
    }
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible  {
    [self setLoadingViewVisible:loadingViewVisible animated:YES];
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated {
    [self setLoadingViewVisible:loadingViewVisible animated:animated completionHandler:nil];
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible
                     animated:(BOOL)animated
            completionHandler:(GNVoidBlock)handler
{
    [self bringSubviewToFront:self.loadingView];
    [self.loadingView setVisible:loadingViewVisible animated:animated completionHandler:handler];
}

- (BOOL)loadingViewVisible {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark Public

- (UIView<GNSpinnerView> *)spinnerView {
    return [GNLoadingView loadingViewInSuperview:self];
}

@end
