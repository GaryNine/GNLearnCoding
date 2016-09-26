//
//  GNImageModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNImageModel.h"

#import "GNCacheModel.h"

#import "GNLocalModel.h"
#import "GNInternetModel.h"

@implementation GNImageModel

#pragma mark -
#pragma makr Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    GNCacheModel *cache = [GNCacheModel cache];
    if ([cache containsObjectForKey:url]) {
        return [cache objectForKey:url];
    }
    
    Class class = [url isFileURL] ? [GNLocalModel class] : [GNInternetModel class];
    
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

@end
