//
//  UITableView+GNExtensions.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/21/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "UITableView+GNExtensions.h"

#import "UINib+GNExtensions.h"

@implementation UITableView (GNExtensions)

#pragma mark -
#pragma mark Public

- (id)cellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

@end
