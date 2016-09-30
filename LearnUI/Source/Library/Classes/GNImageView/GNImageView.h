//
//  GNImageView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNModelObserver.h"
#import "GNView.h"

@class GNImageModel;

@interface GNImageView : GNView <GNModelObserver>
@property (nonatomic, strong)   IBOutlet    UIImageView *contentImageView;

@property (nonatomic, strong)   GNImageModel    *imageModel;

@end
