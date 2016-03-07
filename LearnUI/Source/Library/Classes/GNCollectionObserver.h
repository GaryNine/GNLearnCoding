//
//  GNCollectionObserver.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GNArrayModel;
@class GNCollectionChangeModel;

@protocol GNCollectionObserver <NSObject>

@optional
- (void)collection:(NSArray *)arrayModel didChangeWithModel:(GNCollectionChangeModel *)changeModel;

@end
