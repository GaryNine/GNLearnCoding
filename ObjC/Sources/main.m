//
//  main.m
//  GNLearnObjC
//
//  Created by Igor Devyatko on 11/23/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNBeingTests.h"
#import "NSObject+GNExtensions.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[GNBeingTests object] performTests];
    }
    return 0;
}