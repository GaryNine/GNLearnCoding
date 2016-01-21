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

#import "GNQueue.h"

#import "GNEmployeeObserverProtocol.h"

static const NSUInteger kGNWashermenCount = 3;

@interface GNEnterprise () <GNEmployeeObserverProtocol>
@property (nonatomic, retain)   NSMutableArray  *mutableEmployees;
@property (nonatomic, retain)   GNQueue         *carsQueue;

- (void)hireEmployees;
- (void)dismissEmployees;

- (id)freeEmployeeOfClass:(Class)Class;

- (void)addEmployees:(NSArray *)employees withObservers:(NSArray *)observers;
- (void)addEmployee:(GNEmployee *)employee withObservers:(NSArray *)observers;

@end

@implementation GNEnterprise

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    [self dismissEmployees];
    self.carsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if(self) {
        self.mutableEmployees = [NSMutableArray array];
        [self hireEmployees];
        self.carsQueue = [GNQueue object];
    }

    return self;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(GNCar *)car {
    GNWasherman *washerman = [self freeEmployeeOfClass:[GNWasherman class]];
    if (washerman) {
        [washerman performWorkWithObject:car];
    } else {
        [self.carsQueue enqueueObject:car];
    }
}

#pragma mark -
#pragma mark Private

- (void)hireEmployees {
    GNAccountant *accountant = [GNAccountant object];
    GNManager *manager = [GNManager object];
    
    id washermen = [GNWasherman objectsWithCount:kGNWashermenCount];
    [self addEmployees:washermen withObservers:@[self, accountant]];
    
    [self addEmployee:accountant withObservers:@[self, manager]];
    [self addEmployee:manager withObservers:nil];
}

- (void)addEmployees:(NSArray *)employees withObservers:(NSArray *)observers {
    for (GNEmployee *employee in employees) {
        [self addEmployee:employee withObservers:observers];
    }
}

- (void)addEmployee:(GNEmployee *)employee withObservers:(NSArray *)observers {
    for (id observer in observers) {
        [employee addObserver:observer];
    }
    
    [self.mutableEmployees addObject:employee];
}

- (void)dismissEmployees {
    id employees = self.mutableEmployees;
    NSArray *employeeObservers = @[self, employees];
    for (id employee in employees) {
        [employee removeObserversFromArray:employeeObservers];
    }
    
    self.mutableEmployees = nil;
    
}

- (id)freeEmployeeOfClass:(Class)Class {
    for (GNEmployee *employee in self.mutableEmployees) {
        if ([employee isMemberOfClass:Class] && employee.state == kGNEmployeeIsFree) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark GNObserverProtocol

- (void)employeeDidBecomeFree:(id)employee {
    if ([employee class] == [GNWasherman class]) {
        NSLog(@"Washerman did finish with car");
    } else if ([employee class] == [GNAccountant class]) {
        NSLog(@"Accountant did count washerman");
    }
}

@end
