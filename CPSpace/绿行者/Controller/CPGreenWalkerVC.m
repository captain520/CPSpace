//
//  CPGreenWalkerVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/2/18.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPGreenWalkerVC.h"
#import "CPWalkerView.h"

@interface CPGreenWalkerVC ()

@property (nonatomic, strong) CPWalkerView *bgIV;

@end

@implementation CPGreenWalkerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
}
#pragma mark - setter && getter method
- (CPWalkerView *)bgIV {
    
    if (!_bgIV) {
        CGRect imageFrame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 402./250);
        _bgIV = [[CPWalkerView alloc] initWithFrame:imageFrame];
    }
    
    return _bgIV;
}
#pragma mark - Setup UI
- (void)setupUI {
    [self setTitle:@"绿行者"];
    [self.view addSubview:self.bgIV];
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}

#pragma mark - Private method implement


@end
