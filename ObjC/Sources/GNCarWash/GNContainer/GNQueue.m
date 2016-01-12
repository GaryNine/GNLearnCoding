//
//  GNQueue.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/11/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNQueue.h"

@implementation GNQueue

- (void)enQueueObject:(id)object {
    [self addItem:object];
}

- (id)deQueueObject {
    id object = nil;
    object = [[self items] firstObject];
    
    if (object) {
        [[object retain] autorelease];
        [self removeItem:object];
    }
    
    return object;
}

@end
