//
//  NSURL+GNExtensions.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/21/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (GNExtensions)

+ (NSString *)nameFromURL:(NSURL *)url;
+ (NSString *)nameFromURL:(NSURL *)url withCharacters:(NSCharacterSet *)characterSet;

- (NSString *)fileName;

@end
