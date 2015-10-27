//
//  main.c
//  GNLearnC
//
//  Created by Igor Devyatko on 23.09.15.
//  Copyright (c) 2015 IDAP College. All rights reserved.
//

#include "GNSizeOfTypesPrintTest.h"
#include "GNBasicTypeValuePrintTest.h"
#include "GNParentTypeOutputTests.h"
#include "GNStructurePrintTests.h"
#include "GNValueBitOutputTests.h"
#include "GNObjectTests.h"

int main(int argc, const char * argv[]) {
    GNSizeOfTypesPrintTest();
    GNPrintBasicTypeTest();
    GNParentTypeOutputTests();
    GNOffsetofPrintTests();
    GNValueBitOutputTests();
    
    
    GNPerformGNObjectTests();
   
   return 0;
}
