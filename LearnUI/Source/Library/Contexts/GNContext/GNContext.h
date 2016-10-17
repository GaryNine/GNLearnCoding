//
//  GNContext.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNContext : NSObject
@property (nonatomic, strong)   id  model;

+ (instancetype)contextWithModel:(id)model;

- (instancetype)initWithModel:(id)model;

- (void)execute;
- (void)cancel;

- (void)load;

- (BOOL)shouldLoadState:(NSUInteger)state;

@end
 
