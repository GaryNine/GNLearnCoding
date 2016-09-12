//
//  GNView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/12/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNLoadingView.h"

typedef void(^GNVoidBlock)(void);

@interface GNView : UIView
@property (nonatomic, strong)   GNLoadingView   *loadingView;

- (void)setLoadingViewVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setLoadingViewVisible:(BOOL)visible animated:(BOOL)animated completionHandler:(GNVoidBlock)handler;

@end
