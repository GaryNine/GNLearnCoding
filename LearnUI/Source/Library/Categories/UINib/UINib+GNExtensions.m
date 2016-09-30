//
//  UINib+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/21/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "UINib+GNExtensions.h"

@implementation UINib (GNExtensions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass(cls) bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    return [[self nibWithClass:cls bundle:nil] objectWithClass:cls owner:owner options:options];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self instantiateWithOwner:owner options:options];
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

@end
