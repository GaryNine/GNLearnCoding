//
//  GNUsers.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNUsers.h"
#import "GNUser.h"

#import "NSObject+GNExtensions.h"

static const NSUInteger kGNInitialUsersCount = 7;

@interface GNUsers ()

- (void)fillWithUsers:(NSArray *)users;

@end

@implementation GNUsers

#pragma mark -
#pragma mark Initializations & Deallocation

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self fillWithUsers:[NSObject objectsWithCount:kGNInitialUsersCount]];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)fillWithUsers:(NSArray *)users {
    for (id user in users) {
        [self addObject:user];
    }
}

@end
