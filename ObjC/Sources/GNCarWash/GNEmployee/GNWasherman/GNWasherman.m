//
//  GNWasherman.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNWasherman.h"
#import "GNCar.h"

static const NSUInteger kGNWashPrice = 150;

@implementation GNWasherman

#pragma mark -
#pragma mark Public

- (void)washCar:(GNCar *)car {
    car.clean = YES;
    sleep(1);
}

#pragma mark -
#pragma mark Private

- (void)processObject:(GNCar *)object {
    [object giveMoney:kGNWashPrice toReceiver:self];
    [self washCar:object];
    
    NSLog(@"washerman did wash car, %@", self);
}

- (void)finishWithObject:(GNEmployee *)object {
    
}

@end
