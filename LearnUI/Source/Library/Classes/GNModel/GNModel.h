//
//  GNModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/13/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNObservableObject.h"
#import "GNArrayModelObserver.h"
#import "GNModelObserver.h"

typedef NS_ENUM(NSUInteger, GNModelState) {
    kGNModelStateDidUnload = kGNCollectionStateCount,
    kGNModelStateWillLoad,
    kGNModelStateDidLoad,
    kGNModelStateDidFailWithLoading,
    kGNModelStateCount
};

@interface GNModel : GNObservableObject
@property (nonatomic, readonly) BOOL        cached;
@property (nonatomic, readonly) NSString    *path;

- (void)load;

// This method should be overriden in subclasses
- (void)performBackgroundLoading;

@end
