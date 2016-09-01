//
//  NSFileManager+GNExtensions.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 8/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (GNExtensions)

+ (NSString *)documentPath;

+ (NSString *)libraryPath;

+ (NSString *)userPath;

+ (NSString *)aplicationPath;

+ (NSString *)cahesPath;

+ (NSString *)downloadsPath;

+ (NSString *)loadedStatePath;

@end
