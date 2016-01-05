//
//  GNContainer.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/22/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNContainer : NSObject
@property (nonatomic, readonly)                 NSUInteger  capacity;
@property (nonatomic, readonly)                 NSSet       *items;
//@property (nonatomic, readonly, getter=isFull)  BOOL full;

+ (instancetype)containerWithCapacity:(NSUInteger)capacity;
- (instancetype)initWithCapacity:(NSUInteger)capacity;

- (void)addItem:(id)item;
- (void)removeItem:(id)item;

- (BOOL)isFullOfItems;

@end
