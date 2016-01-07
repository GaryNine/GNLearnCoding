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

#import "NSObject+GNExtensions.h"

@interface GNEnterprise ()
@property (nonatomic, readwrite, retain)    GNContainer *employees;

- (void)hireEmployee:(GNEmployee *)employee;
- (void)resignEmployee:(GNEmployee *)employee;

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

    GNWasherman *washerman = nil;
    GNManager *manager = nil;
    GNAccountant *accountant = nil;
    
    if ([car isAbleToPayCash:kGNWashPrice]) {
        if (washerman) {
            
            [car giveMoney:kGNWashPrice toReceiver:washerman];
            
            [washerman washCar:car];
            [washerman giveAllMoneyToReceiver:accountant];
            
            [accountant countMoney];
            [accountant giveAllMoneyToReceiver:manager];
            
            [manager takeTheProfit];
            
        }
    }
}

#pragma mark -
#pragma mark Private Implementations

- (void)hireEmployee:(GNEmployee *)employee {
    [self.employees addObject:employee];
}

- (void)resignEmployee:(GNEmployee *)employee {
    [self.employees removeObject:employee];
}

@end
