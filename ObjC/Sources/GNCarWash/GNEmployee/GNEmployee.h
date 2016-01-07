//
//  GNEmployee.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNCashProtocol.h"

@interface GNEmployee : NSObject <GNCashProtocol>

- (void)performWorkWithObject:(id<GNCashProtocol>)object;

@end
