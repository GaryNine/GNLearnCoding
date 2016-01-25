//
//  GNController.h
//  GNLearnCoding
//
//  Created by Igor Devyatko on 1/22/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GNEnterprise;

@interface GNController : NSObject
@property (nonatomic, assign, getter=isBusy)    BOOL    busy;

+ (instancetype)controllerWithEnterprise:(GNEnterprise *)enterprise;

- (instancetype)initWithEnterprise:(GNEnterprise *)enterprise;

- (void)startWork;

@end
