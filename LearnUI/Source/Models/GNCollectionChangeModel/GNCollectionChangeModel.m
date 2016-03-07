//
//  GNCollectionChangeModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNCollectionChangeModel.h"

@implementation GNCollectionChangeModel

#pragma mark -
#pragma makr Initialization & Deallocation

- (instancetype)initWithChangeType:(NSUInteger)changeType {
    self = [super init];
    
    if (self) {
        self.changeType = changeType;
    }
    
    return self;
}

#pragma mark -
#pragma mark Class Methods

+ (instancetype)changeModelWithChangeType:(NSUInteger)changeType {
    return [[self alloc] initWithChangeType:changeType];
}

@end
