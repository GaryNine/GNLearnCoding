//
//  GNContainer.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/22/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNContainer : NSObject
@property (nonatomic, readonly) NSSet   *items;

- (void)addItem:(id)item;
- (void)removeItem:(id)item;

@end
