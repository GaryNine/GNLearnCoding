//
//  GNEmployee.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/7/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNEmployee : NSObject

@property (nonatomic, readonly)     NSUInteger      salary;
@property (nonatomic, readonly)     NSUInteger      experience;

- (void)performResponcibility;

@end
