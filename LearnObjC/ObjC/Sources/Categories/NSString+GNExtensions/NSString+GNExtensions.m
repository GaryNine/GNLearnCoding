//
//  NSString+GNExtension.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/6/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "NSString+GNExtensions.h"

@implementation NSString (GNExtension)

static const NSUInteger kLCHDefaultRandomStringLength = 31;

#pragma mark -
#pragma mark Alphabets

+ (instancetype)alphanumericAlphabet {
    NSMutableString *result = [NSMutableString string];
    
    [result appendString:[self letterAlphabet]];
    [result appendString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('0', '9' - '0' + 1)];
}

+ (instancetype)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('a', 'z' - 'a' + 1)];
}

+ (instancetype)capitalizedLetterAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('A', 'Z' - 'A' + 1)];
}

+ (instancetype)letterAlphabet {
    NSMutableString *result = [NSMutableString string];
    
    [result appendString:[self lowercaseLetterAlphabet]];
    [result appendString:[self capitalizedLetterAlphabet]];
    
    return [self stringWithString:result];
}

+ (instancetype)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)randomString {
    return [self randomStringWithLength:kLCHDefaultRandomStringLength];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(id)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    
    for (NSUInteger index = 0; index < length; index++) {
        [result appendFormat:@"%c", [alphabet characterAtIndex:arc4random_uniform((uint32_t)[alphabet length])]];
    }
    
    return [self stringWithString:result];
}

@end
