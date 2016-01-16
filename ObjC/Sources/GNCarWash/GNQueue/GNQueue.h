//
//  GNQueue.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNQueue : NSObject

- (void)enqueueObject:(id)object;
- (id)dequeueObject;

@end
