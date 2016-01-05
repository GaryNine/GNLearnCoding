//
//  GNRoom.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNRoom.h"
#import "GNContainer.h"

static const NSUInteger kGNInitialEmployeeCapacity = 2;

@interface GNRoom ()
@property (nonatomic, readwrite, retain)    GNContainer   *mutableEmployees;

@end

@implementation GNRoom
@dynamic employees;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)room {
    return [[[self alloc] initWithCapacity:kGNInitialEmployeeCapacity] autorelease];
}

+ (instancetype)roomWithCapacity:(NSUInteger)capacity {
    return [[[self alloc] initWithCapacity:capacity] autorelease];
}

#pragma mark -
#pragma mark Initialization & Deallocation

- (void)dealloc {
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [self init];
    
    if (self) {
        [GNContainer containerWithCapacity:capacity];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)employees {
    return [self.mutableEmployees items];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addEmployee:(id)employee {
    if (![self isFullOfEmployees]) {
        [self.mutableEmployees addItem:employee];
    }
}

- (void)removeEmployee:(id)employee {
    [self.mutableEmployees removeItem:employee];
}

- (BOOL)isFullOfEmployees {
    return [self.mutableEmployees isFullOfItems];
}

@end
