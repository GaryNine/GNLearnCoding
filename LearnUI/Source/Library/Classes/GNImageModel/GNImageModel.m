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
@property (nonatomic, readonly) NSString    *filePath;

@end

@implementation GNImageModel

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
        
    }
    
    return self;
}

- (BOOL)cached {
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:self.filePath];
}

- (void)load {
    if (!self.cached) {
        //- должна асинхронно загрузить из интернета картинку;
        //- в бекграунде сохранить ее на жесткий диск;
        //- создать из данных, загруженных из интернета картинку;
        //- сообщить наблюдателям о том, что загрузилась;
    } else {
        //- загрузить картинку из файла, закешированного в файловой системе;
        //- сообщить наблюдателям о том, что загрузилась;
        //- при неконсистентности закешированного изображения должна удалить его и начать процесс загрузки из интернета
        //- при ошибке во время загрузки из интернета, должна нотифицировать наблюдателей об ошибке загрузки;
        //- должна иметь возможность отменить загрузку, что приводит к обнулению закачанных данных или изображения по факту загрузки;
    }
}

- (void)performBackgroundLoading {
    
}

- (NSString *)cachedFileName {
    //- имя закешированного файла должно генерировацца из URL;
}

- (NSString *)filePath {
    
}

@end
