//
//  GNCollectionDoubleIndexChangeModel+UITableView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/9/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GNDoubleIndexCollectionChangeModel+UITableView.h"
#import "GNSingleIndexCollectionChangeModel+UITableView.h"

#import "UITableView+GNExtensions.h"
#import "NSIndexPath+GNExtensions.h"

@implementation GNDoubleIndexCollectionChangeModel (UITableView)

@dynamic toIndexPath;

- (NSIndexPath *)toIndexPath {
    return [NSIndexPath indexPathForRow:self.toIndex];
}

- (void)updateTableView:(UITableView *)tableView {
    NSIndexPath *indexPath = self.indexPath;
    NSIndexPath *toIndexPath = self.toIndexPath;
    NSArray *indexPaths = @[indexPath];
    NSArray *toIndexPaths = @[toIndexPath];
    
    [tableView updateTableViewWithBlock:^(UITableView *object) {
        switch (self.changeType) {
            case kGNChangeTypeObjectMoved:
                [tableView moveRowAtIndexPath:indexPath toIndexPath:toIndexPath];
                break;
                
            case kGNChangeTypeObjectExchanged:
                [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
                [tableView insertRowsAtIndexPaths:toIndexPaths withRowAnimation:UITableViewRowAnimationTop];
                
            default:
                break;
        }
    }];
}

@end
