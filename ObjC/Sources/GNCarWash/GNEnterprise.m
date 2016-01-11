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

#import "GNObserverProtocol.h"

@interface GNEnterprise () <GNObserverProtocol>
@property (nonatomic, retain)   GNContainer *employees;

- (void)hireEmployees;

- (id)freeEmployeeOfClass:(Class)Class;

@end

@implementation GNEnterprise

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.employees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if(self) {
        self.employees = [GNContainer object];
        [self hireEmployees];
    }

    return self;
}

#pragma mark -
#pragma mark Public Implementations

- (void)washCar:(GNCar *)car {
    GNWasherman *washerman = [self freeEmployeeOfClass:[GNWasherman class]];

        if (washerman) {
            [washerman setState:kGNEmployeeIsWorking];
            [washerman performWorkWithObject:(id<GNCashProtocol>)car];
        }
}

#pragma mark -
#pragma mark Private Implementations

- (void)hireEmployees {
    GNWasherman *washerman = [GNWasherman object];
    GNWasherman *washerman2 = [GNWasherman object];
    GNAccountant *accountant = [GNAccountant object];
    GNManager *manager = [GNManager object];
    
    [washerman addObserver:self];
    [washerman2 addObserver:self];
    [accountant addObserver:self];
    [washerman addObserver:accountant];
    [washerman2 addObserver:accountant];
    [accountant addObserver:manager];

    id employees = self.employees;
    [employees addItem:washerman];
    [employees addItem:washerman2];
    [employees addItem:accountant];
    [employees addItem:manager];
}

- (id)freeEmployeeOfClass:(Class)Class {
    for (id employee in [[self employees] items]) {
        if ([employee isMemberOfClass:Class] && [employee state] == kGNEmployeeIsFree) {
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
