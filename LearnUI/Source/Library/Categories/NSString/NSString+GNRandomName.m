//
//  NSString+GNRandomName.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/16/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSString+GNRandomName.h"

#import "NSString+GNExtensions.h"

static const NSUInteger GNRandomNameLength = 10;

@implementation NSString (GNRandomName)

+ (NSString *)randomName {
    NSString *alphabet = [self lowercaseLetterAlphabet];
    
    return [[self randomStringWithLength:GNRandomNameLength alphabet:alphabet] capitalizedString];
}

@end
