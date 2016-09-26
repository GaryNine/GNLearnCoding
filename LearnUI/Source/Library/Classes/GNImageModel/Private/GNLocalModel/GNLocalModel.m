//
//  GNLocalModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/23/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNLocalModel.h"
#import "NSFileManager+GNExtensions.h"

@implementation GNLocalModel

- (UIImage *)imageWithURL:(NSURL *)url {
    return [UIImage imageWithContentsOfFile:url.path];
}

@end
