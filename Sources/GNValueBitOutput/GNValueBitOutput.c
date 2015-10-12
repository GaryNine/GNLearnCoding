//
//  GNValueBitOutput.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/6/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include <stdio.h>
#include "GNValueBitOutput.h"

#pragma mark -
#pragma mark Private Declarations

static const int kGNBitMask = 1;
static const int kGNBitCount = 8;

static
void GNPrintBits (uint8_t byte);

#pragma mark -
#pragma mark Public Implementations


void GNValueBitOutput(void *value, size_t sizeOfValue, GNEndianType endianType) {
    
    if (endianType == kGNEndianTypeLittleEndian) {
        for (unsigned long countByte = 0; countByte < sizeOfValue; countByte++) {
            uint8_t byte = ((uint8_t *) value)[countByte];
            GNPrintBits(byte);
            printf(" ");
        }
    }
    
    if (endianType == kGNEndianTypeBigEndian) {
        for (unsigned long countByte = sizeOfValue; countByte > 0; countByte--) {
            uint8_t byte = ((uint8_t *)value)[countByte - 1];
            GNPrintBits(byte);
            printf(" ");
        }
    }
    
    printf("\n");
}

#pragma mark -
#pragma mark Private Implementations

void GNPrintBits (uint8_t byte) {
    for (unsigned long count = kGNBitCount; count != 0; count--) {
        printf("%d", ((byte >> (count - 1)) & kGNBitMask));
    }
}
