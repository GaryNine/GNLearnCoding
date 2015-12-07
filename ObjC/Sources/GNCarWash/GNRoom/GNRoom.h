//
//  GNRoom.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/7/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNRoom : NSObject

@property (nonatomic, readonly)     NSSet       *staff;
@property (nonatomic, readonly)     NSUInteger  staffCapacity;

@end
