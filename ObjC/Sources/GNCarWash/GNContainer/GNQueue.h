//
//  GNQueue.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNContainer.h"

// enqueueObject
// dequeueObject

@interface GNQueue : GNContainer

- (void)enQueueObject:(id)object;
- (id)deQueueObject;

@end
