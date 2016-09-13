//
//  GNView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/12/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNView.h"

@implementation GNView

#pragma mark - 
#pragma mark Initializations & Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.loadingView = [GNLoadingView loadingViewInSuperview:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLoadingView:(GNLoadingView *)loadingView {
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
            completionHandler:(GNVoidBlock)handler {
    if (_loadingViewVisible != loadingViewVisible) {
        _loadingViewVisible = loadingViewVisible;
        [self bringSubviewToFront:self.loadingView];
        
        [self.loadingView setVisible:loadingViewVisible animated:animated completionHandler:handler];
    }
}
@end
