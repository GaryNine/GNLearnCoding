//
//  GNBuilding.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNBuilding.h"
#import "GNRoom.h"

@interface GNBuilding ()
@property (nonatomic, readwrite, retain)    NSMutableSet    *mutableRooms;

@end

@implementation GNBuilding
@dynamic rooms;

#pragma mark - 
#pragma mark Class Methods

+ (instancetype)building {
    return [[[self alloc] initWithRoom:[GNRoom room]] autorelease];
}

+ (instancetype)buildingWithRoom:(id)room {
    return [[self alloc] initWithRoom:room];
}

#pragma mark -
#pragma mark Initializatinos & Deallocation

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.mutableRooms = [NSMutableSet set];
    }
    
    return self;
}

- (instancetype)initWithRoom:(id)room {
    self = [self init];
    
    if (self) {
        [self.mutableRooms addObject:room];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (NSSet *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addRoom:(id)room {
    [self.mutableRooms addObject:room];
}

- (void)removeRoom:(id)room {
    [self.mutableRooms removeObject:room];
}

@end


