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

@dynamic cached;
@dynamic path;

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
#pragma mark Accessors

- (BOOL)cached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}


// This method should be overriden in subclasses
- (NSString *)path {
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        NSUInteger state = self.state;
        if(kGNModelStateWillLoad == state | kGNModelStateDidLoad == state) {
            [self notifyOfState:state];
            
            return;
        }
        
        self.state = kGNModelStateWillLoad;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            [self performBackgroundLoading];
        });
    }
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
