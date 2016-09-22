//
//  GNImageModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

//1. Создать модель изображения, которая бы удовлетворяла следующим требованиям:
//- должна иметь возможность отменить загрузку, что приводит к обнулению закачанных данных или изображения по факту загрузки;
//2. Создать кеш моделей изображений, который должен удовлетворять следующим требованиям:
//- должен быть потокобезопасным;
//- должен хранить связки моделей изображения с урлами изображений;
//- модели изображений должен хранить через слабые связи;
//- должен быть синглтоном;
//3. Интегрировать кеш изображений в модели изображений для того, чтобы гарантировать, что если у нас либо еще нет моделей, управляющих картинкой по данному урлу, либо она только одна и уникальна. При интеграции должно быть соблюдено следующее поведение:
//- создается модель с определенным урлом и по этому урлу добавляется в кеш
//- создается еще одна модель по тому же урлу, от нее надо избавится в ините и взамен вернуть модель из кеша;
//- при деаллокации модель надо убрать из кеша;
//4. Создать собственный Image View, который бы был оберткой над UIImageView и работал только с моделями изображений, описанными выше, при этом полностью отвечал за загрузки и анимации при загрузках;

#import <UIKit/UIImage.h>

#import "GNModel.h"

@class GNImageModelCache;

static NSString * const kGNURL = @"https://pixabay.com/en/autobots-logo-logo-design-1625828/";
static NSString * const kGNImagePath = @"image";

@interface GNImageModel : GNModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

- (void)load;

+ (GNImageModelCache *)imageModelCache;

@end
