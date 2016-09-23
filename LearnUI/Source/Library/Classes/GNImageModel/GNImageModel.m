//
//  GNImageModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNImageModel.h"
#import "NSFileManager+GNExtensions.h"
#import "NSURL+GNExtensions.h"
#import "GNCacheModel.h"

@interface GNImageModel ()
@property (nonatomic, strong)   UIImage             *image;
@property (nonatomic, copy)     NSString            *name;
@property (nonatomic, copy)     NSURL               *url;
@property (nonatomic, readonly) NSURLRequest        *request;
@property (nonatomic, readonly) NSURLSession        *session;
@property (nonatomic, strong)   NSURLSessionTask    *task;

- (void)loadFromWeb;
- (void)loadFromDisk;

@end

@implementation GNImageModel
@dynamic path;
@dynamic session;
@dynamic request;
@dynamic name;
@dynamic url;

#pragma mark -
#pragma makr Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.task = nil;
    [[GNCacheModel cache] removeObjectForKey:self.url];
}

- (instancetype)initWithURL:(NSURL *)url {
    GNCacheModel *cache = [GNCacheModel cache];
    id object = [cache objectForKey:url];
    if (object) {
        return object;
    }
    
    self = [super init];
    self.url = url;
    [cache setObject:self forKey:url];
    
    return self;
}

- (instancetype)init {
    return [self initWithURL:nil];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [[NSFileManager imagePath] stringByAppendingPathComponent:self.name];
}

- (NSURL *)url {
    return [NSURL URLWithString:kGNURL];
}

- (NSString *)name {
    return [self.url fileName];
}

- (NSURLSession *)session {
    return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

- (NSURLRequest *)request {
    return [NSURLRequest requestWithURL:self.url];
}

- (void)setTask:(NSURLSessionTask *)task {
    if (_task != task) {
        [_task cancel];
        
        _task = task;
    }
}

#pragma mark -
#pragma mark Public

- (void)performBackgroundLoading {
    
}

- (void)load {
    if (!self.cached) {
        [self loadFromWeb];
    } else {
        [self loadFromDisk];
    }
}

#pragma mark -
#pragma mark Private

- (void)loadFromWeb {
    NSURLSessionDownloadTask *task = [self.session downloadTaskWithRequest:self.request
                                                         completionHandler:
                                      ^(NSURL *location, NSURLResponse *response, NSError *error)
                                      {
                                          if (error) {
                                              self.state = kGNModelStateDidFailWithLoading;
                                              
                                              return;
                                          }
                                          UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                                          if (image) {
                                              [[NSFileManager defaultManager] moveItemAtURL:location
                                                                                      toURL:[NSURL fileURLWithPath:self.path]
                                                                                      error:nil];
                                              self.state = kGNModelStateDidLoad;
                                          }
                                      }];
    [task resume];
}

- (void)loadFromDisk {
    UIImage *image = [UIImage imageWithContentsOfFile:self.path];
    if (!image) {
        self.state = kGNModelStateDidFailWithLoading;
        [[NSFileManager defaultManager] removeItemAtPath:self.path error:nil];
        [self loadFromWeb];
    }
    self.state = kGNModelStateDidLoad;
}



@end
