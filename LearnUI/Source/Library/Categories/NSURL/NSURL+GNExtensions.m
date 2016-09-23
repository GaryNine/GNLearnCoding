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
    NSCharacterSet *characterSet = [NSCharacterSet URLUserAllowedCharacterSet];
    return [[url absoluteString] stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

+ (NSString *)nameFromURL:(NSURL *)url withCharacters:(NSCharacterSet *)characterSet {
    return [[url absoluteString] stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

- (NSString *)fileName {
    return [self.path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
}

@end
