//
//  GNCollectionChangeModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNCollectionChangeModel : NSObject
@property (nonatomic, readonly)   NSUInteger  changeType;

+ (instancetype)changeModelWithChangeType:(NSUInteger)changeType;
- (instancetype)initWithChangeType:(NSUInteger)changeType;

@end
