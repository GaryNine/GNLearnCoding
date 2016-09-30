//
//  GNInternetModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/23/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNWebImage.h"
#import "NSURL+GNExtensions.h"
#import "NSFileManager+GNExtensions.h"

@interface GNWebImage ()
@property (nonatomic, strong)   NSURLSessionTask    *task;
@property (nonatomic, readonly) NSString            *name;
@property (nonatomic, readonly) NSString            *path;
@property (nonatomic, readonly) NSURL               *fileUrl;

- (NSURLSession *)session;

@end

@implementation GNWebImage

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
        [self finishLoadingWithImage:image];
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
                     
                     NSURL *fileUrl = self.fileUrl;
                     [[NSFileManager defaultManager] moveItemAtURL:location
                                                             toURL:fileUrl
                                                             error:nil];

                     UIImage *image = [self imageWithURL:self.cached ? fileUrl : location];
                     [self finishLoadingWithImage:image];
                 }];
}

#pragma mark -
#pragma mark Private

- (NSURLSession *)session {
    return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
}

@end
