//
//  GNValueBitOutputTests.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include <stdio.h>

#include "GNValueBitOutput.h"

#pragma mark -
#pragma mark Private Declarations

static
GNEndianType GNCurrentEndianType (void);

static
void GNValueBitOutputTestChar(void);

static
void GNValueBitOutputTestShort(void);

static
void GNValueBitOutputTestInt(void);

#pragma mark -
#pragma mark Public Implementations


void GNValueBitOutputTests(void) {
    GNValueBitOutputTestChar();
    GNValueBitOutputTestShort();
    GNValueBitOutputTestInt();
}

#pragma mark -
#pragma mark Private Implementations


GNEndianType GNCurrentEndianType (void) {
    uint16_t someValue = 1;
    GNEndianType endianType = kGNEndianTypeUnknown;
    endianType = (*((uint8_t *) &someValue) == 0 ) ? kGNEndianTypeBigEndian : kGNEndianTypeLittleEndian;
   
    return endianType;
}

void GNValueBitOutputTestChar(void) {
    char value = 5;
    GNValueBitOutput(&value, sizeof(value), GNCurrentEndianType());
}

void GNValueBitOutputTestShort(void) {
    short value = 7;
    GNValueBitOutput(&value, sizeof(value), GNCurrentEndianType());
}

void GNValueBitOutputTestInt(void) {
    int value = 9;
    GNValueBitOutput(&value, sizeof(value), GNCurrentEndianType());
}
