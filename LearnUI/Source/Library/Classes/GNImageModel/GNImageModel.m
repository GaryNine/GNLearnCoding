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
@property (nonatomic, strong)   NSString    *name;  //?

- (NSString *)imagePath;
- (void)loadFromFileSystem;
- (void)loadFromWeb;
- (NSOperationQueue *)queue;

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

#pragma mark -
#pragma mark Public

- (void)performBackgroundLoading {
    
}

- (void)load {
    if (!self.cached) {
        [self loadFromWeb];
    } else {
        [self loadFromFileSystem];
    }
}

#pragma mark -
#pragma mark Private

- (NSString *)imagePath {
    return  [[NSFileManager imagePath] stringByAppendingPathComponent:kGNImage];
}

- (void)loadFromFileSystem {
    self.image = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    self.state = kGNModelStateDidLoad;
    if () {
        
    }
}

- (void)loadFromWeb {
    
    
}

- (NSOperationQueue *)queue {
    static NSOperationQueue *queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [NSOperationQueue new];
        queue.maxConcurrentOperationCount = 2;
    });
}

@end
