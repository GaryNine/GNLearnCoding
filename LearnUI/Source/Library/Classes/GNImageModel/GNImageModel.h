//
//  GNImageModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIImage.h>

#import "GNModel.h"

@interface GNImageModel : GNModel
@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, strong)   NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

- (void)finishLoadingWithImage:(UIImage *)image;

@end
