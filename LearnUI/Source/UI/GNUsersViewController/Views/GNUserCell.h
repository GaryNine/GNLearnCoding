//
//  GNUserCell.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/18/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNTableViewCell.h"

#import "GNModelObserver.h"

@class GNUser;
@class GNView;

@interface GNUserCell : GNTableViewCell <GNModelObserver>
@property (nonatomic, strong)   IBOutlet UILabel        *label;
@property (nonatomic, strong)   IBOutlet UIImageView    *contentImageView;
@property (nonatomic, strong)   IBOutlet GNView         *view;

@property (nonatomic, strong)   GNUser  *user;

- (void)fillWithModel:(GNUser *)user;

@end
