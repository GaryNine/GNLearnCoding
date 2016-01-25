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

static const NSUInteger kGNWashermenCount = 1;
static const NSUInteger kGNAccountantCount = 1;
static const NSUInteger kGNManagerCount = 1;

@interface GNEnterprise ()
@property (nonatomic, retain)   NSMutableArray  *mutableEmployees;
@property (nonatomic, retain)   GNDispatcher    *washermenDispatcher;
@property (nonatomic, retain)   GNDispatcher    *accountantsDispatcher;
@property (nonatomic, retain)   GNDispatcher    *managersDispatcher;

- (void)hireEmployees;
- (void)dismissEmployees;

- (void)addEmployees:(NSArray *)employees withDispatcher:(GNDispatcher *)dispatcher withObservers:(NSArray *)observers;

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
    NSArray *accountants = [GNAccountant objectsWithCount:kGNAccountantCount];
    NSArray *managers = [GNManager objectsWithCount:kGNManagerCount];
    
    [self addEmployees:washermen withDispatcher:self.washermenDispatcher withObservers:accountants];
    [self addEmployees:accountants withDispatcher:self.accountantsDispatcher withObservers:managers];
    [self addEmployees:managers withDispatcher:self.managersDispatcher withObservers:nil];
}

- (void)addEmployees:(NSArray *)employees withDispatcher:(GNDispatcher *)dispatcher withObservers:(NSArray *)observers {
    NSMutableArray *mutableEmployees = self.mutableEmployees;
    for (id employee in employees) {
        [dispatcher addHandler:employee];
        [mutableEmployees addObject:employee];
        [employee addObserversFromArray:observers];
    }
}

- (void)dismissEmployees {
    NSMutableArray *employees = self.mutableEmployees;
    NSArray *observers = @[self.washermenDispatcher, self.accountantsDispatcher, self.managersDispatcher, employees];
    for (GNEmployee *employee in employees) {
        [employee removeObserversFromArray:observers];
    }
    
    self.mutableEmployees = nil;
}

@end
