//
//  NSFileManager+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 8/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSFileManager+GNExtensions.h"

@implementation NSFileManager (GNExtensions)

+ (NSString *)documentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)libraryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)userPath {
    return [NSSearchPathForDirectoriesInDomains(NSUserDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)aplicationPath {
    return [NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)cahesPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)downloadsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES) firstObject];
}

@end
