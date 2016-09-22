//
//  GNImageModelCache.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNObservableObject.h"

//2. Создать кеш моделей изображений, который должен удовлетворять следующим требованиям:
//- должен быть потокобезопасным;
//- должен хранить связки моделей изображения с урлами изображений;
//- модели изображений должен хранить через слабые связи;
//- должен быть синглтоном;

@interface GNImageModelCache : NSObject
@property (nonatomic, strong)   NSMapTable  *models;
@property (nonatomic, readonly) NSArray     *keys;

- (id)objectForKey:(id)key;
- (void)setObject:(id)object forKey:(id)key;

- (id)objectForKeydSubscript:(id)key;
- (void)setObject:(id)object forKeydSubscript:(id)key;

- (void)removeObjectForKey:(id)key;


@end
