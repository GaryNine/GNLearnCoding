//
//  GNDispatch.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 2/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GNDispatchQueueType) {
    GNDispatchQueueInteractive = QOS_CLASS_USER_INTERACTIVE,
    GNDispatchQueueInitiated = QOS_CLASS_USER_INITIATED,
    GNDispatchQueueUtility = QOS_CLASS_UTILITY,
    GNDispatchQueueBackground = QOS_CLASS_BACKGROUND,
    GNDispatchQueueDefault = QOS_CLASS_DEFAULT,
    GNDispatchQueueMain
};

extern
void GNDispatchSyncOnMainQueue(dispatch_block_t block);

extern
void GNDispatchAsyncOnMainQueu(dispatch_block_t block);

extern
void GNDispatchSyncOnBackgroundQueue(dispatch_block_t block);

extern
void GNDispatchAsyncOnBackgroundQueue(dispatch_block_t block);
