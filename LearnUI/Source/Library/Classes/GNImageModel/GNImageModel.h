//
//  GNImageModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIImage.h>

#import "GNModel.h"

static NSString * const kGNURL = @"https://pixabay.com/en/autobots-logo-logo-design-1625828/";

@interface GNImageModel : GNModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

@end
