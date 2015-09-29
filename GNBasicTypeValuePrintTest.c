//
//  GNBasicTypeValuePrintTest.c
//  GNLearnC
//
//  Created by Igor Devyatko on 9/29/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include "stdio.h"
#include "GNBasicTypeValuePrintTest.h"
#include "GNBasicTypeValue.h"

#pragma mark - 
#pragma mark Private Implementations

GNBasicTypeValue(int, %i)
GNBasicTypeValue(short, %d)
GNBasicTypeValue(char, %c)
GNBasicTypeValue(float, %f)
GNBasicTypeValue(double, %f)


void GNPrintBasicTypeTest(void) {
    GNBasicTypeOutput(int, 5)
    GNBasicTypeOutput(short, 6)
    GNBasicTypeOutput(char, 'a')
    GNBasicTypeOutput(float, 2.35)
    GNBasicTypeOutput(double, 35.46)
  
}