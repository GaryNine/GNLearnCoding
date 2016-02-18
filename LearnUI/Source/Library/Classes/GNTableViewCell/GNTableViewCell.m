//
//  GNTableViewCell.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNTableViewCell.h"

@implementation GNTableViewCell

#pragma mark -
#pragma mark Accessors

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
