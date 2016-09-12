//
//  GNModelStateProtocol.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/8/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNArrayModelObserver.h"

typedef NS_ENUM(NSUInteger, GNModelState) {
    kGNModelStateDidUnload = kGNCollectionStateCount,
    kGNModelStateWillLoad,
    kGNModelStateDidLoad,
    kGNModelStateDidFailWithLoading,
    kGNModelStateCount
};

@protocol GNModelObserverProtocol <NSObject, GNArrayModelObserver>

@optional
- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailWithLoading:(id)model;

@end