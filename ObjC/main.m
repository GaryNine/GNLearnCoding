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
#import "GNController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[GNController controllerWithEnterprise:[GNEnterprise object]] startWork];
        
        [[NSRunLoop mainRunLoop] run];
    }
    
    return 0;
}
