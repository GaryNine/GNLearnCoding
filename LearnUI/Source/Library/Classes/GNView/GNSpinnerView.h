//
//  GNSpinnerView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/13/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GNVoidBlock)(void);

@protocol GNSpinnerView <NSObject>
@property (nonatomic, assign, getter = isVisible)   BOOL    visible;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completionHandler:(GNVoidBlock)handler;

@end
