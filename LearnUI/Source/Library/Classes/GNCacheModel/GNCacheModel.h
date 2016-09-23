//
//  GNImageModelCache.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNObservableObject.h"

@interface GNCacheModel : NSObject
@property (nonatomic, readonly) NSArray     *keys;

+ (GNCacheModel *)cache;

- (id)objectForKey:(id)key;
- (void)setObject:(id)object forKey:(id)key;

- (id)objectForKeydSubscript:(id)key;
- (void)setObject:(id)object forKeydSubscript:(id)key;

- (void)removeObjectForKey:(id)key;


@end
