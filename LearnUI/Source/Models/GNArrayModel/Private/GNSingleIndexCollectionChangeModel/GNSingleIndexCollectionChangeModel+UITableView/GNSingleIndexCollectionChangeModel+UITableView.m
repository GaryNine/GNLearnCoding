//
//  GNCollectionSingleIndexChangeModel+UITableView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 3/9/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "UIKit/UIKit.h"

#import "GNSingleIndexCollectionChangeModel+UITableView.h"

#import "UITableView+GNExtensions.h"
#import "NSIndexPath+GNExtensions.h"

@implementation GNSingleIndexCollectionChangeModel (UITableView)

@dynamic indexPath;

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

- (void)updateTableView:(UITableView *)tableView {
    NSIndexPath *indexPath = self.indexPath;
    NSArray *indexPaths = @[indexPath];
    
    [tableView updateTableViewWithBlock:^(UITableView *object) {
        switch (self.changeType) {
            case kGNChangeTypeObjectAdded:
                [tableView insertRowsAtIndexPaths:indexPaths
                                 withRowAnimation:UITableViewRowAnimationTop];
                break;
                
            case kGNChangeTypeObjectRemoved:
                [tableView deleteRowsAtIndexPaths:indexPaths
                                 withRowAnimation:UITableViewRowAnimationFade];
                break;
                
            case kGNChangeTypeObjectInserted:
                [tableView insertRowsAtIndexPaths:indexPaths
                                 withRowAnimation:UITableViewRowAnimationTop];
                break;
                
            case kGNChangeTypeObjectReplaced:
                [tableView reloadRowsAtIndexPaths:indexPaths
                                 withRowAnimation:UITableViewRowAnimationTop];
                
            default:
                break;
        }
    }];
    
    if (kGNChangeTypeObjectAdded == self.changeType) {
        [tableView scrollToRowAtIndexPath:indexPath
                         atScrollPosition:UITableViewScrollPositionBottom
                                 animated:YES];
    }
}

@end
