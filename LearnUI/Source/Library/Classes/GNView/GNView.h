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
@property (nonatomic, strong)   IBOutlet    GNLoadingView   *loadingView;

@property (nonatomic, assign)   BOOL    loadingViewVisible;


- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated;
- (void)setLoadingViewVisible:(BOOL)loadingViewVisible animated:(BOOL)animated
            completionHandler:(GNVoidBlock)handler;

@end
