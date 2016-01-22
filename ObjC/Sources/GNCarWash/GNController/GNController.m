//
//  GNController.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/22/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNController.h"
#import "GNEnterprise.h"

#import "GNCar.h"

static const NSUInteger kGNDefaultCarsCount = 10;

@interface GNController ()
@property (nonatomic, retain)   GNEnterprise    *enterprise;

@end

@implementation GNController

#pragma mark -
#pragma mark Class Methods

+ (instancetype)controllerWithEnterprise:(GNEnterprise *)enterprise {
    return [[[self alloc] initWithEnterprise:enterprise] autorelease];
}

#pragma mark - 
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.enterprise = nil;
    
    [super dealloc];
}

- (instancetype)initWithEnterprise:(GNEnterprise *)enterprise {
    self = [self init];
    if (self) {
        self.enterprise = enterprise;
    }
    
    return self;
}

#pragma mark - 
#pragma mark Public

- (void)startWork {
    [self.enterprise washCars:[GNCar objectsWithCount:kGNDefaultCarsCount]];
}

@end
