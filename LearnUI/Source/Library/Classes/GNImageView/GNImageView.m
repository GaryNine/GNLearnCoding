//
//  GNImageView.m
//  GNLearnUI
//
//  Created by Igor Devyatko on 9/17/16.
//  Copyright © 2016 IDAP College. All rights reserved.
//

#import "GNImageView.h"

#import "GNImageModel.h"

@interface GNImageView ()

- (void)initSubviews;

@end

@implementation GNImageView

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.contentImageView = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.contentImageView) {
        [self initSubviews];
    }
}

- (void)initSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                                | UIViewAutoresizingFlexibleWidth
                                | UIViewAutoresizingFlexibleRightMargin
                                | UIViewAutoresizingFlexibleTopMargin
                                | UIViewAutoresizingFlexibleHeight
                                | UIViewAutoresizingFlexibleBottomMargin;
    
    self.contentImageView = imageView;
}

#pragma mark -
#pragma mark Accessors

- (void)setContentImageView:(UIImageView *)contentImageView {
    if (_contentImageView != contentImageView) {
        [_contentImageView removeFromSuperview];
        _contentImageView = contentImageView;
        [self addSubview:contentImageView];
    }
}

- (void)setImageModel:(GNImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        _imageModel = imageModel;
        [_imageModel addObserver:self];
        
        [imageModel load];
    }
}

#pragma mark -
#pragma mark Private

#pragma mark -
#pragma mark ModelObserver

- (void)modelDidUnload:(id)model {

}

- (void)modelWillLoad:(id)model {
    
}

- (void)modelDidLoad:(id)model {
    
}

- (void)modelDidFailWithLoading:(id)model {
    
}

@end
