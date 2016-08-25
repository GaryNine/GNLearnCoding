//
//  NSPathUtilities+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 8/25/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "NSPathUtilities+GNExtensions.h"

NSString *NSSearchPathForDirectory(NSSearchPathDirectory directory) {
    return [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) firstObject];
}
