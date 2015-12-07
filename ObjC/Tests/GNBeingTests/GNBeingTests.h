//
//  GNBeingTests.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 11/30/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNBeing.h"
#import "GNMale.h"
#import "GNFemale.h"
#import "GNBeingProtocol.h"

//2. Создать несколько существ и положить их в массив, каждому из существ добавить детей;
//3. В цикле пройти по массиву существ и проверить их пол. Если мужик, то надо отправить существо воевать, если баба, то рожать детей;

//5. Создать массив существ, в котором бы лежали только мужчины и женщины, пройтись по нему через for (Creature *creature in creatures) и вызвать метод performGenderSpecificOperation, которой, в зависимости от пола существа приведет либо к войне, либо к родам -> Подчеркнуть, что это - полиморфизм, значит, охуенно.

@interface GNBeingTests : NSObject

- (void)performTests;

@end
