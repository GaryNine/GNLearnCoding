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
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            NSURLSessionDownloadTask *task = [self.session downloadTaskWithRequest:self.request
                                                                 completionHandler:
                                              ^(NSURL *location, NSURLResponse *response, NSError *error)
                                              {
                                                  UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                                                  if (image) {
                                                      [[NSFileManager defaultManager] moveItemAtURL:location
                                                                                              toURL:[NSURL fileURLWithPath:self.path]
                                                                                              error:nil];
                                                      self.state = kGNModelStateDidLoad;
                                                  }
                                              }];
            [task resume];
            
            //- должна асинхронно загрузить из интернета картинку;
            //- в бекграунде сохранить ее на жесткий диск;
            //- создать из данных, загруженных из интернета картинку;
            //- сообщить наблюдателям о том, что загрузилась;
        });
    } else {
        UIImage *image = [UIImage imageWithContentsOfFile:self.path];
        if (image) {
            self.state = kGNModelStateDidLoad;
        } else {
            [[NSFileManager defaultManager] removeItemAtPath:self.path error:nil];
        }
        //- загрузить картинку из файла, закешированного в файловой системе;
        //- сообщить наблюдателям о том, что загрузилась;
        //- при неконсистентности закешированного изображения должна удалить его и начать процесс загрузки из интернета
        //- при ошибке во время загрузки из интернета, должна нотифицировать наблюдателей об ошибке загрузки;
        //- должна иметь возможность отменить загрузку, что приводит к обнулению закачанных данных или изображения по факту загрузки;
    }
}

#pragma mark -
#pragma mark Private

- (NSString *)imagePath {
    return  [[NSFileManager imagePath] stringByAppendingPathComponent:self.name];
}

@end
