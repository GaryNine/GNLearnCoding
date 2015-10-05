//
//  GNStructurePrintTests.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/5/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include "GNStructurePrintTests.h"
#include "GNPerformStructure.h"
#include "GNSizeOfTypes.h"

#pragma mark -
#pragma mark Public Implementations

void GNOffsetofPrintTests(void) {
    GNPrintSizeOfTypes(GNSomeStructure);
    GNOffsetofPrintStructures(GNSomeStructure);
    GNOffsetofPrintUnionBool(GNSomeStructure);
    
    GNPrintSizeOfTypes(GNOptimizedStructure);
    GNOffsetofPrintStructures(GNOptimizedStructure);
    GNOffsetofPrintUnionBool(GNOptimizedStructure);
    
    GNPrintSizeOfTypes(GNUnionBoolStructure);
    GNOffsetofPrintStructures(GNUnionBoolStructure);
    GNOffsetofPrint(GNUnionBoolStructure, boolMarker);
}
