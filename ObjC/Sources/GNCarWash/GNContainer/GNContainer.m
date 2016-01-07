//
//  GNContainer.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/22/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNContainer.h"

@interface GNContainer ()
@property (nonatomic, readwrite, retain)    NSMutableSet    *mutableItems;

@end

@implementation GNContainer

@dynamic items;

#pragma mark -
#pragma mark Initialization & Deallocation

- (void)dealloc {
    self.mutableItems = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableItems = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)items {
    return [[self.mutableItems copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addItem:(id)item {
    [self.mutableItems addObject:item];
}

- (void)removeItem:(id)item {
    [self.mutableItems removeObject:item];
}

@end
