//
//  GNFemale.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 11/29/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNFemale.h"

@implementation GNFemale

#pragma mark -
#pragma mark Public Implementation

- (GNGenderType)gender {
    return kGNFemale;
}

#pragma mark - 
#pragma mark GNBeing Protocol

- (id)performGenderSpecificOperation {
    
    return [[self class]beingWithGender:arc4random_uniform(kGNUndefined)];
}

@end
