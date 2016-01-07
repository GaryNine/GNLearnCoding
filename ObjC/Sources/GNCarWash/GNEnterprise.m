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

#import "GNContainer.h"
#import "GNConstants.h"

#import "NSObject+GNExtensions.h"

@interface GNEnterprise ()
@property (nonatomic, readwrite, retain)    GNContainer *employees;

- (void)hireEmployees;
- (void)resignEmployees;

- (id)freeEmployeeOfClass:(Class)Class;

@end

@implementation GNEnterprise

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    [self resignEmployees];
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
#pragma mark Accessors

- (NSSet *)employees {
    return [[self.employees copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)washCar:(GNCar *)car {
    GNWasherman *washerman = [self freeEmployeeOfClass:[GNWasherman class]];
    GNAccountant *accountant = [self freeEmployeeOfClass:[GNAccountant class]];
    GNManager *manager = [self freeEmployeeOfClass:[GNManager class]];

        if (washerman && accountant && manager) {
            [washerman performWorkWithObject:car];
            
            [accountant performWorkWithObject:washerman];
            
            [manager performWorkWithObject:accountant];
        }
}

#pragma mark -
#pragma mark Private Implementations

- (void)hireEmployees {
    GNWasherman *washerman = [GNWasherman object];
    GNAccountant *accountant = [GNAccountant object];
    GNManager *manager = [GNManager object];
    
    if (washerman && accountant && manager) {
        [self.employees addItem:washerman];
        [self.employees addItem:accountant];
        [self.employees addItem:manager];
        
    }
}

- (void)resignEmployees {
    for (id employee in [[self employees] items]) {
        [self.employees removeItem:employee];
    }
}

- (id)freeEmployeeOfClass:(Class)Class {
    id result = nil;
    
    for (id employee in [[self employees] items]) {
        if ([employee isMemberOfClass:Class]) {
            employee = result;
        }
    }
    
    return result;
}

@end
