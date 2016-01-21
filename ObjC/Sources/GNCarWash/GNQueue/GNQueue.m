//
//  GNQueue.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNQueue.h"

@interface GNQueue ()
@property (nonatomic, retain)   NSMutableArray  *mutableObjects;

@end

@implementation GNQueue

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.mutableObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
     
     if (self) {
         self.mutableObjects = [NSMutableArray array];
     }
     
     return self;
}

#pragma mark -
#pragma mark Public

- (void)enqueueObject:(id)object {
    @synchronized(self) {
        [self.mutableObjects addObject:object];
    }
}

- (id)dequeueObject {
    @synchronized(self) {
        id object = [self.mutableObjects firstObject];
        
        if (object) {
            [[object retain] autorelease];
            [self.mutableObjects removeObject:object];
        }
    }
    
    return object;
}

@end
