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

@interface GNWasherman ()
@property (nonatomic, readwrite, assign)    NSUInteger  cash;

@end

@implementation GNWasherman

@synthesize cash = _cash;

#pragma mark -
#pragma mark Public Implementations

- (void)washCar:(GNCar *)car {
    
}

- (void)performWorkWithObject:(GNCar *)object {
        [object giveMoney:kGNWashPrice toReceiver:self];
        [object setClean:YES];
}

@end
