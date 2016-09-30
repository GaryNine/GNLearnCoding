//
//  GNLocalModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/23/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNFileImage.h"
#import "NSFileManager+GNExtensions.h"

@implementation GNFileImage

- (UIImage *)imageWithURL:(NSURL *)url {
    return [UIImage imageWithContentsOfFile:url.path];
}

- (void)performBackgroundLoading {
    [self finishLoadingWithImage:[self imageWithURL:self.url]];
}

@end
