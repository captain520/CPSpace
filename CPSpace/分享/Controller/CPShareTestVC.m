//
//  CPShareTestVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/6/5.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPShareTestVC.h"

@interface CPShareTestVC ()

@property (nonatomic, strong) UIActivityViewController * activityVC;

@end

@implementation CPShareTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(action:)];
    
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSArray *activityItems = @[url];

    self.activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (void)action:(id)sender {
    [self presentViewController:self.activityVC animated:YES completion:nil];
}

@end
