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

@interface GNImageModel ()
@property (nonatomic, strong)   UIImage             *image;
@property (nonatomic, strong)   NSString            *name;
@property (nonatomic, strong)   NSURL               *url;
@property (nonatomic, readonly) NSURLRequest        *request;
@property (nonatomic, readonly) NSURLSession        *session;
@property (nonatomic, strong)   NSURLSessionTask    *task;

- (NSString *)imagePath;
- (void)loadFromWeb;

@end

@implementation GNImageModel
@dynamic path;
@dynamic session;
@dynamic request;

#pragma mark -
#pragma makr Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.task = nil;
}

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
    return [[self imagePath] stringByAppendingPathComponent:kGNImagePath];
}

- (NSURL *)url {
    return [NSURL URLWithString:kGNURL];
}

- (NSString *)name {
    return [NSURL nameFromURL:self.url];
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
    // сохранить на жесткий диск
}

- (void)load {
    if (!self.cached) {
        [self loadFromWeb];
    } else {
        UIImage *image = [UIImage imageWithContentsOfFile:self.path];
        if (image) {
            self.state = kGNModelStateDidLoad;
        } else {
            [[NSFileManager defaultManager] removeItemAtPath:self.path error:nil];
            [self loadFromWeb];
        }
    }
}

#pragma mark -
#pragma mark Private

- (NSString *)imagePath {
    return  [[NSFileManager imagePath] stringByAppendingPathComponent:self.name];
}

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

@end
