//
//  GNLocalModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/23/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNImageModel.h"

@interface GNFileImage : GNImageModel

- (UIImage *)imageWithURL:(NSURL *)url;

@end
