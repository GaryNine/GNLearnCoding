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

@interface GNUsers : GNArrayModel
@property (nonatomic, readonly) NSString    *archivePath;
@property (nonatomic, readonly) BOOL        cached;

- (void)save;
- (void)load;

@end
