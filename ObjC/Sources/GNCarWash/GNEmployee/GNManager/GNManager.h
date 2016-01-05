//
//  GNManager.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 12/8/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#import "GNEmployee.h"

@interface GNManager : GNEmployee

- (void)performWorkWithObject:(id<GNCashProtocol>)object;

- (void)takeTheProfit;

@end
