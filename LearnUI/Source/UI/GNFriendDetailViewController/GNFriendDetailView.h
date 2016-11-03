//
//  GNFriendDetailView.h
//  GNLearnUI
//
//  Created by Igor Devyatko on 10/3/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNView.h"

@class GNImageView;
@class GNUser;

@interface GNFriendDetailView : GNView
@property (nonatomic, strong)   IBOutlet GNImageView    *imageView;
@property (nonatomic, strong)   IBOutlet UILabel        *firstName;
@property (nonatomic, strong)   IBOutlet UILabel        *lastName;
@property (nonatomic, strong)   IBOutlet UILabel        *gender;
@property (nonatomic, strong)   IBOutlet UILabel        *email;
@property (nonatomic, strong)   IBOutlet UILabel        *birtday;

@property (nonatomic, strong)   GNUser  *user;

@end
