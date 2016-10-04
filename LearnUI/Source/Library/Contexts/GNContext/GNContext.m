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
#pragma mark Class methods

+ (instancetype)contextWithModel:(id)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithModel:(id)model {
    self = [super init];
    self.model = model;
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)execute {
    GNModel *model = self.model;
    @synchronized (model) {
        NSUInteger state = model.state;
        
        if ([self shouldLoadState:state]) {
            [model notifyWithSelector:[model selectorForState:state]];
            return;
        }
        
        state = kGNModelStateWillLoad;

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            [self load];
        });
    }
}

- (void)cancel {
    
}

- (void)load {
    
}

- (BOOL)shouldLoadState:(NSUInteger)state {
    return 0;
}

@end
