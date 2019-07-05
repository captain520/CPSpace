//
//  CPTableBaseVC.m
//  CPLibs
//
//  Created by 王璋传 on 2019/2/16.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTableBaseVC.h"

@interface CPTableBaseVC ()

@end

@implementation CPTableBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = @[].mutableCopy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Setter && getter method

- (UITableView *)dataTableView {
    if (!_dataTableView) {
        _dataTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        _dataTableView.delegate = self;
        _dataTableView.dataSource = self;

        [self.view addSubview:_dataTableView];
    }
    
    return _dataTableView;
}

#pragma mark - Delegate && dataSource method implement

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return self.dataArray.count; }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return [self.dataArray[section] count]; }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath { return 44;}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"section:%@, row:%@",@(indexPath.section),@(indexPath.row)];
    
    return cell;
}

- (void)loadData {
    self.dataArray = @[
                       @[@"Test",@"Test"],
                       @[@"Test",@"Test"],
                       @[@"Test",@"Test"],
                       ].mutableCopy;
    
    [self.dataTableView reloadData];
    
}

@end
