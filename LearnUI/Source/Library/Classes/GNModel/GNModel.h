//
//  GNModel.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/13/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

//5. Создать абстрактную родительскую модель, отвечающую следующим требованиям:
//- обеспечивает переход между потоками;
//- дает точки перегрузки для бекграундной обработки загрузки;
//- сгенерировано несколько typedef состояний, отвечающих за разные состояния загрузки модели;
//- сгенерирован протокол нотификации наблюдателей о различных состояниях;
//- есть методы для нотификации наблюдателей о разных состояниях модели;
//- при загрузке уже загруженной модели повторная загрузка происходить не должна;
//- при загрузке уже загруженной модели должна происходить нотификация о том, что модель загружена;
//- нужно также учесть, что полноценной автоматизации всех переходов при обработке данных и нотификаций сделать не выйдет, т.к.операции могут быть не только синхронными (как в упражнении 7 первого блока) так и асинхронными, соответственно, добавить нужные возможности для завершения процесса обработки в наследниках класса;

#import <Foundation/Foundation.h>

#import "GNObservableObject.h"
#import "GNArrayModelObserver.h"
#import "GNModelObserver.h"

typedef NS_ENUM(NSUInteger, GNModelState) {
    kGNModelStateDidUnload = kGNCollectionStateCount,
    kGNModelStateWillLoad,
    kGNModelStateDidLoad,
    kGNModelStateDidFailWithLoading,
    kGNModelStateCount
};

@interface GNModel : GNObservableObject

- (void)load;

// This method should be overriden in subclasses
- (void)performBackgroundLoading;

@end
