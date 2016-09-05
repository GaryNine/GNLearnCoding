//
//  NSFileManager+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 8/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSFileManager+GNExtensions.h"
#import "NSPathUtilities+GNExtensions.h"

#import "GNDispatchOnce.h"

static NSString * const kGNAppStatePathName = @"loadedStatePath";
static NSString * const kGNImagePathName    = @"imagePath";

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

+ (NSString *)appStatePath {
    GNDispatchOnce(NSString, libraryPath,
                   ^ { return [self dataPathWithFileName:kGNAppStatePathName]; });
}

+ (NSString *)imagePath {
    GNDispatchOnce(NSString, libraryPath,
                   ^{ return [self dataPathWithFileName:kGNImagePathName]; })
}

+ (NSString *)dataPathWithFileName:(NSString *)filemane {
    return [[self libraryPath] stringByAppendingPathComponent:filemane];
}

@end
