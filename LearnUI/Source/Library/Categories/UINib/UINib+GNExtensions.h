//
//  UINib+GNExtensions.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/21/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (GNExtensions)

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)cls;

- (id)objectWithClass:(Class)cls;

@end
