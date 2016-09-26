//
//  GNImageModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNImageModel.h"

#import "GNCacheModel.h"

#import "GNFileImage.h"
#import "GNWebImage.h"

@implementation GNImageModel

#pragma mark -
#pragma makr Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    GNCacheModel *cache = [GNCacheModel cache];
    id object = [cache objectForKey:url];
    if (object) {
        return object;
    }
    
    Class class = [url isFileURL] ? [GNFileImage class] : [GNWebImage class];
    
    return [[class alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    [[GNCacheModel cache] removeObjectForKey:self.url];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    self.url = url;
    [[GNCacheModel cache] setObject:self forKey:url];
    
    return self;
}

- (instancetype)init {
    return [self initWithURL:nil];
}

#pragma mark -
#pragma mark Public

- (void)finishLoadingWithImage:(UIImage *)image {
    self.image = image;
    self.state = image ? kGNModelStateDidLoad : kGNModelStateDidFailWithLoading;
}

@end
