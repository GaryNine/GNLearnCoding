//
//  GNUserCell.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNTableViewCell.h"

@class GNUser;
@class GNLoadingView;

@interface GNUserCell : GNTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *label;
@property (nonatomic, strong)   IBOutlet UIImageView    *contentImageView;

@property (nonatomic, strong)   GNUser          *user;
@property (nonatomic, strong)   GNLoadingView   *loadingView;

- (void)fillWithModel:(GNUser *)user;

@end
