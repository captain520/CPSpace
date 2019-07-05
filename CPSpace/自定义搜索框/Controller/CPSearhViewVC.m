//
//  CPSearhViewVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/17.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPSearhViewVC.h"

#import "CPSearchView.h"

@interface CPSearhViewVC ()

@property (nonatomic, strong) CPSearchView * searchView;

@end

@implementation CPSearhViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
}
#pragma mark - setter && getter method
- (CPSearchView *)searchView {
    
    if (nil == _searchView) {
        
         __weak typeof(self) weakSelf = self;
        
        _searchView = [[CPSearchView alloc] initWithFrame:CGRectMake(0, 100, UIScreen.mainScreen.bounds.size.width, 60)];
        _searchView.placeHolder = @"请输入你要搜索的关键词";
//        _searchView.actionName = @"🔍";
        _searchView.textfieldCornerRadius = 100;
        _searchView.actionNameColor = UIColor.grayColor;
        _searchView.actionBlock = ^{
            [weakSelf handleActionBlock];
        };
    }
    
    return _searchView;
}

- (void)handleActionBlock {
    [_searchView endEditing:YES];
}
#pragma mark - Setup UI
- (void)setupUI {
    
    [self.view addSubview:self.searchView];
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

@end
