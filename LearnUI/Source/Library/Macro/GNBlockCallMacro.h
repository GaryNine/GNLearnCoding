//
//  GNBlockCallMacro.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#define GNEmpty 

#define __GNBlockCall(block, ...) \
do { \
    typeof(block) var = block; \
    if(var) { \
       var(__VA_ARGS__); \
    } \
} while(0)

#define GNBlockCall(...) __GNBlockCall(__VA_ARGS__)
