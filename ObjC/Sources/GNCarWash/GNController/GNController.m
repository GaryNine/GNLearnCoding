//
//  GNController.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/22/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNController.h"
#import "GNEnterprise.h"

#import "GNCar.h"

static const NSUInteger kGNDefaultCarsCount = 20;
static const NSUInteger kGNDefaultTimeInterval = 1.0;

@interface GNController ()
@property (nonatomic, retain)   GNEnterprise    *enterprise;
@property (nonatomic, retain)   NSTimer         *timer;

- (void)startBackgroundWork;

@end

@implementation GNController

#pragma mark -
#pragma mark Class Methods

+ (instancetype)controllerWithEnterprise:(GNEnterprise *)enterprise {
    return [[[self alloc] initWithEnterprise:enterprise] autorelease];
}

#pragma mark - 
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.enterprise = nil;
    self.timer = nil;
    
    [super dealloc];
}

- (instancetype)initWithEnterprise:(GNEnterprise *)enterprise {
    self = [self init];
    if (self) {
        self.enterprise = enterprise;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isWorking  {
    return nil != self.timer;
}

- (void)setWorking:(BOOL)working {
    if (working) {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:kGNDefaultTimeInterval
                                                          target:self
                                                        selector:@selector(startWork)
                                                        userInfo:nil
                                                         repeats:YES];
        self.timer = timer;
    } else {
        self.timer = nil;
    }
}

- (void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer release];
        [_timer invalidate];
        _timer = timer;
        [_timer retain];
    }
}

#pragma mark - 
#pragma mark Public

- (void)startWork {
    [self performSelectorInBackground:@selector(startBackgroundWork) withObject:nil];
}

#pragma mark -
#pragma mark Private

- (void)startBackgroundWork {
    [self.enterprise washCars:[GNCar objectsWithCount:kGNDefaultCarsCount]];
}

@end
