//
//  GNImageModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNImageModel.h"
#import "NSFileManager+GNExtensions.h"

@interface GNImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   NSString    *name;

- (NSString *)imagePath;

@end

@implementation GNImageModel
@dynamic path;

#pragma mark -
#pragma makr Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    
    if (self) {
        self.url = url;
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithURL:nil];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [self imagePath];
}

- (NSURL *)url {
    return [NSURL URLWithString:kGNURL];
}

- (NSString *)name {
    return [self.url.path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
}

#pragma mark -
#pragma mark Public

- (void)performBackgroundLoading {
    
}

- (void)load {
    if (!self.cached) {

    } else {

    }
}

#pragma mark -
#pragma mark Private

- (NSString *)imagePath {
    return  [[NSFileManager imagePath] stringByAppendingPathComponent:self.name];
}

@end
