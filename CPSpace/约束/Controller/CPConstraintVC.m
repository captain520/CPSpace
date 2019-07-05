//
//  CPConstraintVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/19.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPConstraintVC.h"

@interface CPConstraintVC ()

@property (nonatomic, strong) UIView * testView00;
@property (nonatomic, strong) UIView * testView01;

@property (nonatomic, strong) UIButton * testButton;

@end

@implementation CPConstraintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)setEditing:(BOOL)editing {
    [super setEditing:editing];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.testView00 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1./3 constant:0]];
    
    [self.view setNeedsUpdateConstraints];
    [self.view layoutIfNeeded];

}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    self.testView00 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.testView00.backgroundColor = UIColor.purpleColor;

    [self.view addSubview:self.testView00];
    self.testView00.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.testView00 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.testView00 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.testView00 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.testView00 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:.5 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.testView00 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.5 constant:0]];

//    [self.view setNeedsLayout];
//    [self.view updateConstraints];

}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

@end
