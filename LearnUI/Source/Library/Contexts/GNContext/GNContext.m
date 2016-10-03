//
//  GNContext.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNContext.h"

#import "GNModel.h"

@implementation GNContext

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithModel:(id)model {
    self = [super init];
    
    if (self) {
        self.model = model;
    }
    
    return self;
}

- (void)execute {
    @synchronized (self) {
        NSUInteger state = self.model.state;
        if(kGNModelStateWillLoad == state | kGNModelStateDidLoad == state) {
            [self.model notifyWithSelector:[self.model selectorForState:state]];
            
            return;
        }
        
        self.model.state = kGNModelStateWillLoad;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            [self.model performBackgroundLoading];
        });
    }
    
}

- (void)cancel {
    
}

@end
