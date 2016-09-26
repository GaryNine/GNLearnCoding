//
//  GNInternetModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/23/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNInternetModel.h"
#import "NSURL+GNExtensions.h"
#import "NSFileManager+GNExtensions.h"

@interface GNInternetModel ()
@property (nonatomic, strong)   NSURLSessionTask    *task;
@property (nonatomic, readonly) NSString            *name;
@property (nonatomic, readonly) NSString            *path;
@property (nonatomic, readonly) NSURL               *fileUrl;

- (NSURLSession *)session;

@end

@implementation GNInternetModel

@dynamic name;
@dynamic path;
@dynamic fileUrl;

#pragma mark - 
#pragma mark Initializations & Dealocations

- (void)dealloc {
    self.task = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setTask:(NSURLSessionTask *)task {
    if (_task != task) {
        [_task cancel];
        
        _task = task;
        [_task resume];
    }
}

- (NSString *)name {
    return [self.url fileName];
}

- (NSString *)path {
    return [[NSFileManager imagePath] stringByAppendingPathComponent:self.name];
}

- (NSURL *)fileUrl {
    return [NSURL fileURLWithPath:self.path];
}

#pragma mark -
#pragma mark Public

- (void)performBackgroundLoading {
    UIImage *image = [self imageWithURL:self.fileUrl];
    if (image) {
        self.image = image;
        self.state = kGNModelStateDidLoad;
    } else {
        self.state = kGNModelStateDidFailWithLoading;
        [[NSFileManager defaultManager] removeItemAtURL:self.fileUrl error:nil];
        [self loadFromWeb];
    }
}

- (void)loadFromWeb {
    self.task = [[self session] downloadTaskWithURL:self.url
                                  completionHandler:
                 ^(NSURL *location, NSURLResponse *response, NSError *error)
                 {
                     if (error) {
                         self.state = kGNModelStateDidFailWithLoading;
                         
                         return;
                     }
                     
                     [[NSFileManager defaultManager] moveItemAtURL:location
                                                             toURL:self.fileUrl
                                                             error:nil];
                     
                     if (!self.cached) {
                         UIImage *image = [self imageWithURL:location];
                         self.image = image;
                         self.state = image ? kGNModelStateDidLoad : kGNModelStateDidFailWithLoading;
                     } else {
                         UIImage *image = [self imageWithURL:self.fileUrl];
                         self.image = image;
                         self.state = image ? kGNModelStateDidLoad : kGNModelStateDidFailWithLoading;
                     }
                 }];
}

#pragma mark -
#pragma mark Private

- (NSURLSession *)session {
    return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
}

@end
