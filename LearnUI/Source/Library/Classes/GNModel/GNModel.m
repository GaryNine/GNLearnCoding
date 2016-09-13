//
//  GNModel.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/13/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNModel.h"

#import "GNOwnershipMacro.h"

@implementation GNModel

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        GNWeakify(self);
        [self performBlockWithoutNotifications:^{
            GNStrongify(self);
            self.state = kGNModelStateDidUnload;
        }];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)load {
    NSUInteger state = self.state;
    if(state == kGNModelStateWillLoad | state == kGNModelStateDidLoad) {
        [self notifyWithSelector:[self selectorForState:state]];
        
        return;
    }
    
    state = kGNModelStateWillLoad;
    [self performBackgroundLoading];
}

- (void)performBackgroundLoading {
    
}

#pragma mark -
#pragma mark GNObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kGNModelStateDidUnload:
            return @selector(modelDidUnload:);
            
        case kGNModelStateWillLoad:
            return @selector(modelWillLoad:);
            
        case kGNModelStateDidLoad:
            return @selector(modelDidLoad:);
            
        case kGNModelStateDidFailWithLoading:
            return @selector(modelDidFailWithLoading:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
