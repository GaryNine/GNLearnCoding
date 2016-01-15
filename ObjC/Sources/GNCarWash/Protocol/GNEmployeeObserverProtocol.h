//
//  GNObserverProtocol.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/10/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GNEmployeeObserverProtocol <NSObject>

@optional
- (void)employeeDidBecomeFree:(id)employee;
- (void)employeeDidBecomeWork:(id)employee;
- (void)employeeDidBecomeProcessing:(id)employee;

@end
