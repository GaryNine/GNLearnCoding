//
//  GNEnterprise.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNContainer.h"
#import "GNEnterprise.h"
#import "GNCarWash.h"
#import "GNBuilding.h"
#import "GNWasherman.h"
#import "GNWashbox.h"
#import "GNRoom.h"
#import "GNManager.h"
#import "GNAccountant.h"
#import "GNCar.h"
#import "GNConstants.h"

@interface GNEnterprise ()
@property (nonatomic, readwrite, retain)    NSMutableSet   *mutableBuildings;
@property (nonatomic, readwrite, retain)    NSMutableSet   *mutableEmployees;

- (GNRoom *)freeRoomForEmployeeOfClass:(Class)class;

- (NSSet *)roomsForEmployeeOfClass:(Class)class;

- (GNBuilding *)buildingForEmployeeOfClass:(Class)class;

@end

@implementation GNEnterprise
@dynamic buildings;
@dynamic employees;

#pragma mark - 
#pragma mark Class Methods

+ (instancetype)enterprise {
    return [[[self alloc] initWithCarWash:[GNCarWash building] office:[GNBuilding building]] autorelease];
}

+ (instancetype)enterpriseWithCarWash:(GNCarWash *)carWash office:(GNBuilding *)officeBlock {
    return [[[self alloc] initWithCarWash:carWash office:officeBlock] autorelease];
}

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.mutableBuildings = nil;
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if(self) {
        self.mutableBuildings = [NSMutableSet set];
        self.mutableEmployees = [NSMutableSet set];
    }

    return self;
}

- (instancetype)initWithCarWash:(GNCarWash *)carWash office:(GNBuilding *)officeBlock {
    self = [self init];
    
    if (self) {
        [self.mutableBuildings addObject:carWash];
        [self.mutableBuildings addObject:officeBlock];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (NSSet *)buildings {
    return [[self.mutableBuildings copy] autorelease];
}

- (NSSet *)employees {
    return [[self.mutableEmployees copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)addBuilding:(id)building {
    [self.mutableBuildings addObject:building];
}

- (void)removeBuilding:(id)building {
    [self.mutableBuildings removeObject:building];
}

- (void)hireEmployee:(GNEmployee *)employee {
    id room = [self freeRoomForEmployeeOfClass:[GNEmployee class]];
    
    if (room) {
        [room addEmployee:employee];
    }
}

- (void)kickOutEmployee:(id)employee {
    for (id building in self.mutableBuildings) {
        for (id room in [building rooms]) {
            for (id item in [room employees]) {
                if (employee == item) {
                    [room removeObject:employee];
                }
            }
        }
    }
    
    [self.mutableEmployees removeObject:employee];
}

- (void)washCar:(GNCar *)car {
    GNWashBox       *washBox = nil;
    GNWasherman     *washerman = nil;
    GNManager       *manager = nil;
    GNAccountant    *accountant = nil;
    
    for (id building in self.mutableBuildings) {
        for (id room in [building rooms]) {
            if ([room respondsToSelector:@selector(ableToContainCars)]) {
                washBox = room;
            }
        }
    }
    
    for (id employee in self.employees) {
        if ([employee respondsToSelector:@selector(washCar:)]) {
            washerman = employee;
        }
        
        break;
    }
    
    for (id employee in self.employees) {
        if ([employee respondsToSelector:@selector(countMoney)]) {
            accountant = employee;
        }
        
        break;
    }
    
    for (id employee in self.employees) {
        if ([employee respondsToSelector:@selector(takeTheProfit)]) {
            manager = employee;
        }
        
        break;
    }
    
    if ([car isAbleToPayCash:kGNWashPrice]) {
        if (washBox && washerman) {
            [washBox addCar:car];
            
            [car giveMoney:kGNWashPrice toReceiver:washerman];
            
            [washerman washCar:car];
            [washBox removeCar:car];
            [washerman giveAllMoneyToReceiver:accountant];
            
            [accountant countMoney];
            [accountant giveAllMoneyToReceiver:manager];
            
            [manager takeTheProfit];
            
        }
    }
}

#pragma mark -
#pragma mark Private Implementations

- (GNRoom *)freeRoomForEmployeeOfClass:(Class)class {
    for (id room in [self roomsForEmployeeOfClass:class]) {
        if (![room isFullOfEmployees]) {
            return room;
        }
    }
    
    return nil;
}

- (NSSet *)roomsForEmployeeOfClass:(Class)class {
    Class roomClass = [GNWasherman class] == class ? [GNWashBox class] : [GNRoom class];
    NSMutableSet *rooms = [NSMutableSet set];
    
    for (id room in [[self buildingForEmployeeOfClass:class] rooms]) {
        if ([room isMemberOfClass:roomClass]) {
            [rooms addObject:room];
        }
    }
    
    return rooms;
}

- (GNBuilding *)buildingForEmployeeOfClass:(Class)class {
    Class buildingClass = [GNWasherman class] == class ? [GNCarWash class] : [GNBuilding class];
    
    for (id building in self.mutableBuildings) {
        if ([building isMemberOfClass:buildingClass]) {
            return building;
        }
    }
    
    return nil;
}

@end
