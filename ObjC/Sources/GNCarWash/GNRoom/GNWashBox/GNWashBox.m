//
//  GNWashBox.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNWashBox.h"
#import "GNContainer.h"

static const NSUInteger kGNInitialCapacity = 1;

@interface GNWashBox ()
@property (nonatomic, readwrite, retain)                        GNContainer    *mutableCars;
@property (nonatomic, readwrite, getter=isAbleToContainCars)    BOOL            ableToContainCars;

@end

@implementation GNWashBox
@dynamic cars;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)room {
    return [[[super alloc] initWithCapacity:kGNInitialCapacity] autorelease];
}

#pragma mark - 
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)cars {
    return [self.mutableCars items];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addCar:(GNCar *)car {
    if (![self isFullOfCars]) {
        [self.mutableCars addItem:car];
    }
}

- (void)removeCar:(GNCar *)car {
    [self.mutableCars removeItem:car];
}

- (BOOL)isFullOfCars {
    return [self.mutableCars isFullOfItems];
}

@end
