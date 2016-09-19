//
//  GNImageModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/15/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

//1. Создать модель изображения, которая бы удовлетворяла следующим требованиям:
//- имя закешированного файла должно генерировацца из URL;
//- путь файла должен генерировацца в отдельном методе;
//- при вызове метода load, должна проверить, закешировано ли изображение и:
//а. если не закешировано, то должна:
//- должна асинхронно загрузить из интернета картинку;
//- в бекграунде сохранить ее на жесткий диск;
//- создать из данных, загруженных из интернета картинку;
//- сообщить наблюдателям о том, что загрузилась;
//б. если закешировано, то должна:
//- загрузить картинку из файла, закешированного в файловой системе;
//- сообщить наблюдателям о том, что загрузилась;
//- при неконсистентности закешированного изображения должна удалить его и начать процесс загрузки из интернета
//- при ошибке во время загрузки из интернета, должна нотифицировать наблюдателей об ошибке загрузки;
//- должна иметь возможность отменить загрузку, что приводит к обнулению закачанных данных или изображения по факту загрузки;

#import <UIKit/UIImage.h>

#import "GNModel.h"

static NSString * const kGNURL = @"https://pixabay.com/en/autobots-logo-logo-design-1625828/";
static NSString * const kGNImage = @"image";

@interface GNImageModel : GNModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

- (void)load;

@end
