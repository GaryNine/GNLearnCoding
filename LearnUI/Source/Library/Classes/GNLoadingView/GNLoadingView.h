//
//  GNLoadingView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNSpinnerView.h"

typedef void(^GNVoidBlock)(void);

@interface GNLoadingView : UIView<GNSpinnerView>
@property (nonatomic, strong)   IBOutlet    UIActivityIndicatorView *spinner;

+ (id)loadingViewInSuperview:(UIView *)superView;

@end
