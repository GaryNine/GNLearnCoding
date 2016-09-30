//
//  NSURL+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/21/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSURL+GNExtensions.h"

@implementation NSURL (GNExtensions)

- (NSString *)fileName {
    NSString *absoluteString = [self absoluteString];
    NSCharacterSet *characterSet = [NSCharacterSet URLUserAllowedCharacterSet];
    return [absoluteString stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

@end
