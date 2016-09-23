//
//  GNInternetModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/23/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNInternetModel.h"
#import "NSURL+GNExtensions.h"

@interface GNInternetModel ()
@property (nonatomic, readonly) NSURLRequest        *request;
@property (nonatomic, readonly) NSURLSession        *session;
@property (nonatomic, strong)   NSURLSessionTask    *task;
@property (nonatomic, copy)     NSString            *name;

@end

@implementation GNInternetModel
@dynamic path;
@dynamic session;
@dynamic request;

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
