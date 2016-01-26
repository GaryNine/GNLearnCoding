//
//  GNEnterprise.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEnterprise.h"

#import "GNWasherman.h"
#import "GNAccountant.h"
#import "GNManager.h"
#import "GNCar.h"

#import "GNDispatcher.h"

#import "GNEmployeeObserverProtocol.h"

static const NSUInteger kGNWashermenCount = 5;
static const NSUInteger kGNAccountantsCount = 3;
static const NSUInteger kGNManagersCount = 2;

@interface GNEnterprise ()
@property (nonatomic, retain)   NSMutableArray  *mutableEmployees;
@property (nonatomic, retain)   GNDispatcher    *washermenDispatcher;
@property (nonatomic, retain)   GNDispatcher    *accountantsDispatcher;
@property (nonatomic, retain)   GNDispatcher    *managersDispatcher;

- (void)hireEmployees;
- (void)dismissEmployees;

- (void)addEmployees:(NSArray *)employees withDispatcher:(GNDispatcher *)dispatcher;

@end

@implementation GNEnterprise

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    [self dismissEmployees];

    self.washermenDispatcher = nil;
    self.accountantsDispatcher = nil;
    self.managersDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.washermenDispatcher = [GNDispatcher object];
        self.accountantsDispatcher = [GNDispatcher object];
        self.managersDispatcher = [GNDispatcher object];
        
        [self hireEmployees];
    }

    return self;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(GNCar *)car {
    [self.washermenDispatcher performWorkWithObject:car];
}

- (void)washCars:(NSArray *)cars {
    for (GNCar *car in cars) {
        [self washCar:car];
    }
}

#pragma mark -
#pragma mark Private

- (void)hireEmployees {
    self.mutableEmployees = [NSMutableArray array];
    
    NSArray *washermen = [GNWasherman objectsWithCount:kGNWashermenCount];
    NSArray *accountants = [GNAccountant objectsWithCount:kGNAccountantsCount];
    NSArray *managers = [GNManager objectsWithCount:kGNManagersCount];
    
    [self addEmployees:washermen withDispatcher:self.washermenDispatcher];
    [self addEmployees:accountants withDispatcher:self.accountantsDispatcher];
    [self addEmployees:managers withDispatcher:self.managersDispatcher];
}

- (void)addEmployees:(NSArray *)employees withDispatcher:(GNDispatcher *)dispatcher {
    NSMutableArray *mutableEmployees = self.mutableEmployees;
    for (GNEmployee *employee in employees) {
        [dispatcher addHandler:employee];
        [mutableEmployees addObject:employee];
        [employee addObserver:self];
    }
}

- (void)dismissEmployees {
    NSMutableArray *employees = self.mutableEmployees;
    NSArray *observers = @[self.washermenDispatcher, self.accountantsDispatcher, self.managersDispatcher, self];
    for (GNEmployee *employee in employees) {
        [employee removeObserversFromArray:observers];
    }
    
    self.mutableEmployees = nil;
}

#pragma mark -
#pragma mark GNObserverProtocol

- (void)employeeDidBecomeFinish:(id)employee {
    if ([self.washermenDispatcher containsHandler:employee]) {
        [self.accountantsDispatcher performWorkWithObject:employee];
    } else if ([self.accountantsDispatcher containsHandler:employee]) {
        [self.managersDispatcher performWorkWithObject:employee];
    }
}

@end
