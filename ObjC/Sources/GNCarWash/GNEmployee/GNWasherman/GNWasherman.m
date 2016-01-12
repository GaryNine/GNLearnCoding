//
//  GNWasherman.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNWasherman.h"
#import "GNCar.h"
#import "GNConstants.h"

@implementation GNWasherman

#pragma mark -
#pragma mark Public Implementations

- (void)washCar:(GNCar *)car {
    car.clean = YES;
}

#pragma mark -
#pragma mark Private Implementations

- (void)processObject:(id<GNCashProtocol>)object {
    [object giveMoney:kGNWashPrice toReceiver:self];
    [self washCar:object];
    self.state = kGNEmployeeInProcessing;
}

@end
