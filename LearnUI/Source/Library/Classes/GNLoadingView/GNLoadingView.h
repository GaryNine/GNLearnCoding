//
//  GNLoadingView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GNVoidBlock)(void);

@interface GNLoadingView : UIView
@property (nonatomic, assign)   BOOL                                visible;
@property (nonatomic, strong)   IBOutlet    UIActivityIndicatorView *spinner;

+ (id)loadingViewInSuperview:(UIView *)superView;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completionHandler:(GNVoidBlock)handler;

@end
