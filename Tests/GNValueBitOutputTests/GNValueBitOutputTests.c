//
//  GNValueBitOutputTests.c
//  GNLearnC
//
//  Created by Igor Devyatko on 10/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#include "GNValueBitOutput.h"

#pragma mark -
#pragma mark Private Declarations

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

void GNValueBitOutputTestChar(void) {
    char value = 5   ;
    void  *pointer = &value;
    GNValueBitOutput(pointer, sizeof(value));
}

void GNValueBitOutputTestShort(void) {
    short value = 7;
    void  *pointer = &value;
    GNValueBitOutput(pointer, sizeof(value));
}

void GNValueBitOutputTestInt(void) {
    int value = 9;
    void  *pointer = &value;
    GNValueBitOutput(pointer, sizeof(value));
}
