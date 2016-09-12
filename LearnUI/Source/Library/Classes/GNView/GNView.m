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
#pragma mark Accessors

- (void)setLoadingView:(GNLoadingView *)loadingView {
    if (_loadingView != loadingView) {
        [loadingView removeFromSuperview];
        
        _loadingView = loadingView;
        
        loadingView.frame = self.bounds;
        loadingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:loadingView];
    }
}

- (void)setLoadingViewVisible:(BOOL)visible  {
    [self.loadingView setVisible:visible animated:YES];
}

- (void)setLoadingViewVisible:(BOOL)visible animated:(BOOL)animated {
    [self.loadingView setVisible:visible animated:animated completionHandler:nil];
}

- (void)setLoadingViewVisible:(BOOL)visible
                     animated:(BOOL)animated
            completionHandler:(GNVoidBlock)handler {

}

@end
