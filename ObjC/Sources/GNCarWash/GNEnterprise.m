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

@interface GNEnterprise () <GNEmployeeObserverProtocol>
@property (nonatomic, retain)   NSMutableArray  *mutableEmployees;
@property (nonatomic, retain)   GNQueue         *carsQueue;

- (void)hireEmployees;
- (void)dismissEmployees;

- (id)freeEmployeeOfClass:(Class)Class;

- (void)addEmployees:(NSArray *)employees withObservers:(NSArray *)observers;
- (void)addEmployee:(GNEmployee *)employee withObservers:(NSArray *)observers;

- (void)performBackgroundWorkWithObject:(id)object;

@end

@implementation GNEnterprise

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    [self dismissEmployees];
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if(self) {
        self.mutableEmployees = [NSMutableArray array];
        [self hireEmployees];
    }

    return self;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(GNCar *)car {
    [self performSelectorInBackground:@selector(performBackgroundWorkWithObject:) withObject:car];
}

#pragma mark -
#pragma mark Private

- (void)performBackgroundWorkWithObject:(id)object {
    GNWasherman *washerman = [self freeEmployeeOfClass:[GNWasherman class]];
    if (washerman) {
        [washerman performWorkWithObject:(id)object];
    } else {
        [self.carsQueue enqueueObject:object];
    }
}

- (void)hireEmployees {
    GNAccountant *accountant = [GNAccountant object];
    GNManager *manager = [GNManager object];
    
    id washermen = [GNWasherman objectsWithCount:3];
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
    while ([employees count] > 0) {
        GNEmployee *employee = [employees lastObject];
        NSArray *employeeObservers = employee.observers;
        [employee removeObserversFromArray:employeeObservers];
        
        [employees removeObject:employee];
    }
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
