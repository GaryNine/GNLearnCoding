//
//  ViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNSquareViewController.h"
#import "GNSquareView.h"

#import "GNMacro.h"

@interface GNSquareViewController ()
@property (nonatomic, assign)   GNSquareView    *squareView;

@end

@implementation GNSquareViewController
@dynamic squareView;

#pragma mark -
#pragma mark Accessors

GNViewGetterSynthesize(GNSquareView, squareView);

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
