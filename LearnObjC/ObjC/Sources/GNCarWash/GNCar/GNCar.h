//
//  GNCar.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/7/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNCashProtocol.h"

@interface GNCar : NSObject <GNCashProtocol>

@property (nonatomic, assign, getter=isClean)    BOOL   clean;

+ (instancetype)car;
+ (instancetype)carWithCash:(NSUInteger)cash;

@end
