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
#pragma mark Public Implementations

const int bitMask = 1;

void GNValueBitOutput(void *value, size_t sizeOfValue) {
    uint8_t *byte = ((uint8_t *)value);
    
    for (unsigned long count = sizeOfValue * 8; count != 0; count--) {
        printf("%s", ((*byte >> (count - 1)) & bitMask ? "1" : "0"));
    }
    printf("\n");
}
