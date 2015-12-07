//
//  GNMale.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 11/29/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNMale.h"

@implementation GNMale

#pragma mark -
#pragma mark Public Implementation

- (GNGenderType)gender {
   return kGNMale;
}

#pragma mark -
#pragma mark GNBeing Protocol

- (id)performGenderSpecificOperation {
    NSLog(@"Went To Fight! %@", self);
    
    return nil;
}

@end

