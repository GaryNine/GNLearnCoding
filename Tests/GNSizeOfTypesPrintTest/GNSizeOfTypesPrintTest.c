//
//  GNSizeOfTypesPrintTest.c
//  GNLearnC
//
//  Created by Igor Devyatko on 24.09.15.
//  Copyright (c) 2015 IDAP College. All rights reserved.
//

#include "GNSizeOfTypesPrintTest.h"
#include "GNSizeOfTypes.h"

#pragma mark - 
#pragma mark Public Implementations

void GNSizeOfTypesPrintTest(void) {
    GNPrintSizeOfTypes(int);
    GNPrintSizeOfTypes(short);
    GNPrintSizeOfTypes(long);
    GNPrintSizeOfTypes(long long);
    GNPrintSizeOfTypes(unsigned int);
    GNPrintSizeOfTypes(char);
    GNPrintSizeOfTypes(unsigned char);
    GNPrintSizeOfTypes(float);
    GNPrintSizeOfTypes(double);
    GNPrintSizeOfTypes(long double);
    
    printf("\n");
}
