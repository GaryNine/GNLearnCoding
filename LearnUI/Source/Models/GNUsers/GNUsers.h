//
//  GNUsers.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNArrayModel.h"

typedef NS_ENUM(NSUInteger, GNCollectionChangeType) {
    kGNObjectInitialChangeType,
    kGNObjectAdded,
    kGNObjectRemoved,
    kGNObjectInserted,
    kGNObjectReplaced,
    kGNObjectExchanged,
    kGNObjectMoved
};

@class GNUser;

@interface GNUsers : GNArrayModel

@end
