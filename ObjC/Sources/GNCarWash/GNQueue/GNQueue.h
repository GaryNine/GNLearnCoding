//
//  GNQueue.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNQueue : NSObject
@property (nonatomic, readonly) NSArray *objects;

- (void)enQueueObject:(id)object;
- (id)deQueueObject;

@end
