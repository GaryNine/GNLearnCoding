//
//  GNContext.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GNModel;

@interface GNContext : NSObject
@property (nonatomic, strong)   GNModel  *model;

- (instancetype)initWithModel:(id)model;

- (void)execute;
- (void)cancel;

@end
 
