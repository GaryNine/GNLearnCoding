//
//  GNDispatcher.m
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/24/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

//1. Создать диспетчер обработчиков, который бы отвечал следующим требованиям:
//- имеет очередь объектов на обработку;
//- имеет массив обработчиков, которые могут быть либо заняты, либо готовы к работе;
//- при передаче нового объекта на обработку должен:
//а. передать обработчику объект в случае, если есть свободные обработчики;
//б. поставить его в очередь на обработку;
//- наблюдает за состоянием обработчиков;
//- если обработчик готов к работе и есть очередь объектов на обработку, то отдает первый объект из очереди на обработку;
//- все обработчики, поступающие к нему, должны отвечать заданному ранее протоколу (готов к работе, выполнил работу);
//- диспетчер является потокобезопасным;
//- диспетчер должен быть универсальным и работать с разными объектами, отвечающими одному и тому же протоколу;

//2. Связать в контроллере из задания 7. машины и мойщиков, мойщиков и бухгалтеров через диспетчерЫ, описав следующий технологический процесс:
//- диспетчер мойщиков знает всех мойщиков и получает машины для мытья, передавая их мойщикам в соответствии с 1.;
//- диспетчер бухгалтеров знает всех бухгалтеров и получает работников, которых должен передать обработку бухгалтерам в соответствии с 1.;

//- контроллер предприятия генерирует и передает диспетчеру мойщиков машины, которых должно быть больше, чем мойщиков;
//- контроллер предприятия слушает мойщиков и когда они завершили работу, отдает их диспетчеру бухгалтеров;

//- когда бухгалтер обработал мойщика, то мойщик должен сообщить наблюдателям, что он готов к работе;
//- когда бухгалтер обработал мойщика он должен сообщить об этом директору, чтобы оный сделал профит;
//- когда директор обработал бухгалтера и сделал профит, то он должен сообщить наблюдателям, что готов к работе.


#import "GNDispatcher.h"

#import "GNQueue.h"
#import "GNEmployee.h"

@interface GNDispatcher ()
@property (nonatomic, retain)   GNQueue         *processingQueue;
@property (nonatomic, retain)   NSMutableArray  *mutableHandlers;

- (void)performWork;
- (id)findFreeHandler;

@end

@implementation GNDispatcher

#pragma mark -
#pragma mark Initializations & Deallocation

- (void)dealloc {
    self.processingQueue = nil;
    self.mutableHandlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.processingQueue = [GNQueue object];
        self.mutableHandlers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(id)handler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers) {
        [handlers addObject:handler];
        [handler addObserver:self];
    }
}

- (void)removeHandler:(id)handler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers) {
        [handlers removeObject:handler];
        [handler removeObserver:self];
    }
}

- (void)performWorkWithObject:(id)object {
    [self.processingQueue enqueueObject:object];
    [self performWork];
}

#pragma mark -
#pragma mark Private

- (void)performWork {
    id object = [self.processingQueue dequeueObject];
    if (object) {
        id handler = [self findFreeHandler];
        if (handler) {
            [handler performWorkWithObject:object];
        }
    } else {
        [self.processingQueue enqueueObject:object];
    }
}

- (id)findFreeHandler {
    for (GNEmployee *handler in self.mutableHandlers) {
        if (kGNEmployeeIsFree == handler.state) {
            return handler;
        }
    }
    
    return nil;
}

- (void)employeeDidBecomeFree:(id)employee {
    [self performWork];
}

@end
