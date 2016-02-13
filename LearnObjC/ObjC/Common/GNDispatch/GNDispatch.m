//
//  GNDispatch.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 2/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNDispatch.h"

dispatch_queue_t GNGetDispatchQeue(GNDispatchQueueType queueType) {
    switch (queueType) {
        case GNDispatchQueueMain:
        return dispatch_get_main_queue();
            
        default:
            return dispatch_get_global_queue(queueType, 0);
    }
}

void GNDispatchSyncOnMainQueue(dispatch_block_t block) {
    if ([NSThread isMainThread]) {
        block();
    }
    
    dispatch_sync(dispatch_get_main_queue(), block);
}

void GNDispatchAsyncOnMainQueue(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void GNDispatchSyncOnBackgroundQueue(dispatch_block_t block) {
    dispatch_sync(dispatch_get_global_queue(GNDispatchQueueBackground, 0), block);
}

void GNDispatchAsyncOnBackgroundQueue(dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(GNDispatchQueueBackground, 0), block);
}

void GNDispatchSyncOnQueue(GNDispatchQueueType queueType, dispatch_block_t block) {
    dispatch_sync(GNGetDispatchQeue(queueType), block);
}

void GNDispatchAsyncOnQueue(GNDispatchQueueType queueType, dispatch_block_t block) {
    dispatch_async(GNGetDispatchQeue(queueType), block);
}
