//
//  GNStructurePrintTests.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/5/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNStructurePrintTests_h
#define GNStructurePrintTests_h

#include <stdio.h>
#include <stddef.h>

#define GNOffsetofPrint(structure, structMember) \
    printf("Offsetof " "(" #structMember "): "  "%lu\n", offsetof(structure, structMember))

#define GNOffsetofPrintStructures(structure) \
    GNOffsetofPrint(structure, string); \
    GNOffsetofPrint(structure, doubleValue); \
    GNOffsetofPrint(structure, llValue); \
    GNOffsetofPrint(structure, floatValue); \
    GNOffsetofPrint(structure, intValue); \
    GNOffsetofPrint(structure, shortValue1); \
    GNOffsetofPrint(structure, shortValue2); \
    GNOffsetofPrint(structure, shortValue3); \

#define GNOffsetofPrintUnionBool(structure) \
    GNOffsetofPrint(structure, bool1); \
    GNOffsetofPrint(structure, bool2); \
    GNOffsetofPrint(structure, bool3); \
    GNOffsetofPrint(structure, bool4); \
    GNOffsetofPrint(structure, bool5); \
    GNOffsetofPrint(structure, bool6); \
    printf("\n");

void GNOffsetofPrintTests(void);
void GNSizeofPrintTest(void);

#endif
