//
//  CPRefreshVC.m
//  CPLibs
//
//  Created by 王璋传 on 2019/2/16.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPRefreshVC.h"

@interface CPRefreshVC ()

@end

@implementation CPRefreshVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addRefreshController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method implement

- (void)addRefreshController {
    
    self.currentPage = 1;

    if (self.pageSize == 0) {
        self.pageSize = 10;
    }
    
    __weak typeof(self) weakSelf = self;
    
    self.dataTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        weakSelf.currentPage = 1;
        
        [weakSelf.dataArray removeAllObjects];
        [weakSelf loadData];
    }];
    
    self.dataTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        weakSelf.currentPage++;
        
        [weakSelf loadData];
    }];

}

- (void)loadData {
    
    [self.dataTableView.mj_header endRefreshing];
    [self.dataTableView.mj_footer endRefreshing];
    
    //  ....
}

@end
