//
//  NSFileManager+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 8/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSFileManager+GNExtensions.h"
#import "NSPathUtilities+GNExtensions.h"

static NSString * const kGNLoadedStatePathName = @"loadedStatePath";

@implementation NSFileManager (GNExtensions)

+ (NSString *)documentPath {
    return NSSearchPathForDirectory(NSDocumentDirectory);
}

+ (NSString *)libraryPath {
    return NSSearchPathForDirectory(NSLibraryDirectory);
}

+ (NSString *)userPath {
    return NSSearchPathForDirectory(NSUserDirectory);
}

+ (NSString *)aplicationPath {
    return NSSearchPathForDirectory(NSApplicationDirectory);
}

+ (NSString *)cahesPath {
    return NSSearchPathForDirectory(NSCachesDirectory);
}

+ (NSString *)downloadsPath {
    return NSSearchPathForDirectory(NSDownloadsDirectory);
}

+ (NSString *)loadedStatePath {
    return [[self documentPath] stringByAppendingPathComponent:kGNLoadedStatePathName];
}

@end
