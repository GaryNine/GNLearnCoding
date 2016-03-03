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

#import "GNCollectionObserver.h"

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
        [self fillWithUsers:[GNUser objectsWithCount:kGNInitialUsersCount]];
        self.state = kGNObjectInitialChangeType;
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

#pragma mark -
#pragma mark GNObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kGNObjectAdded:
            return @selector(collectionDidObjectAdd);
            
        case kGNObjectRemoved:
            return @selector(collectionDidObjectRemove);
            
        case kGNObjectInserted:
            return @selector(collectiondidObjectInsert);
            
        case kGNObjectReplaced:
            return @selector(collectionDidObjectReplace);
            
        case kGNObjectExchanged:
            return @selector(collectionDidObjectExchange);
            
        case kGNObjectMoved:
            return @selector(collectionDidObjectMove);
            
        default:
            return [super selectorForState:state];
    }
}

@end
