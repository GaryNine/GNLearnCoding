//
//  main.m
//  GNLearnObjC
//
//  Created by Igor Devyatko on 11/23/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GNBeingTests.h"
#import "GNEnterprise.h"
#import "GNCar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GNEnterprise *enterprise = [GNEnterprise object];
        GNCar *car = [GNCar car];
        [enterprise washCar:car];
    }
    
    return 0;
}
