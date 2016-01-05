//
//  GNEmployee.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEmployee.h"

static const NSUInteger kGNInitialSalary = 5000;
static const NSUInteger kGNInitialExperience = 1;

@interface GNEmployee ()
@property (nonatomic, readwrite, assign)    NSUInteger  cash;
@property (nonatomic, readwrite, assign)    NSUInteger  salary;
@property (nonatomic, readwrite, assign)    NSUInteger  experience;

@end

@implementation GNEmployee
@synthesize cash = _cash;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)employee {
    return [[[self alloc] initWithSalary:kGNInitialSalary experience:kGNInitialExperience] autorelease];
}

+ (instancetype)employeeWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    return [[self alloc] initWithSalary:salary experience:experience];
}

#pragma mark -
#pragma mark Initialization & Deallocation

- (instancetype)initWithSalary:(NSUInteger)salary experience:(NSUInteger)experience {
    self = [self init];
    
    if (self) {
        self.salary = salary;
        self.experience = experience;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementations

- (void)performWorkWithObject:(id<GNCashProtocol>)object {
    
}

#pragma mark - 
#pragma mark GNCarWashProtocol

- (void)giveMoney:(NSUInteger)cash toReceiver:(id<GNCashProtocol>)receiver {
    if ([self isAbleToPayCash:cash]) {
        [receiver takeMoney:cash];
        self.cash -= cash;
    }
}

- (void)takeMoney:(NSUInteger)cash {
    self.cash += cash;
}

@end
