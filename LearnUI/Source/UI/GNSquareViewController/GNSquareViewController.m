//
//  ViewController.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 2/7/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNSquareViewController.h"
#import "GNSquareView.h"

#import "GNViewControllerMacro.h"

GNViewControllerBaseViewProperty(GNSquareViewController, GNSquareView, squareView);

@implementation GNSquareViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Public

- (IBAction)onAnimate:(id)sender {
    GNSquareView *squareView = self.squareView;
    if (squareView.cycleStarted != YES) {
        squareView.cycleStarted = YES;
    } else {
        squareView.cycleStarted = NO;
    }
}

- (IBAction)onNext:(id)sender {
    [self.squareView moveSquareToNextPosition];
}

@end
