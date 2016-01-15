//
//  GNQueue.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNQueue.h"

@interface GNQueue ()
@property (nonatomic, readwrite)    NSMutableSet    *mutableObjects;

@end

@implementation GNQueue

@dynamic objects;

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.mutableObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    [self = [super init];
     
     if (self) {
         self.mutableObjects = [NSMutableSet set];
     }
     
     return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)objects {
    return [[self.mutableObjects copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)enQueueObject:(id)object {
    [self.mutableObjects addObject:object];
}

- (id)deQueueObject {
    id object = nil;
    object = [self.mutableObjects firstObject];
    
    if (object) {
        [[object retain] autorelease];
        [self.mutableObjects removeObject:object];
    }
    
    return object;
}

@end
