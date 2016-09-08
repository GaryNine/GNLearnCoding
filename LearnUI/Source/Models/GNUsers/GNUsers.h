//
//  GNUsers.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNArrayModel.h"

#import "GNModelObserverProtocol.h"

@class GNUser;

typedef NS_ENUM (NSUInteger, GNModelState) {
    kGNModelStateUnload,
    kGNModelStateLoading,
    kGNModelStateDidLoad,
    kGNModelStateFailWithLoading,
    kGNModelState
};

@interface GNUsers : GNArrayModel <GNModelObserverProtocol>
@property (nonatomic, readonly) NSString    *archivePath;

- (void)save;
- (void)load;

@end
