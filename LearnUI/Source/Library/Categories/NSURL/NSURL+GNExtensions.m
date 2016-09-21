//
//  NSURL+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/21/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSURL+GNExtensions.h"

@implementation NSURL (GNExtensions)

+ (NSString *)nameFromURL:(NSURL *)url {
    return [url.path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
}

+ (NSString *)nameFromURL:(NSURL *)url withCharacters:(NSCharacterSet *)characterSet {
    return [url.path stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

@end
