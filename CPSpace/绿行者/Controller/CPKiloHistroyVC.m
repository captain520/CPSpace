//
//  CPKiloHistroyVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/2/19.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPKiloHistroyVC.h"
#import "CPKiloHistoryCell.h"

@interface CPKiloHistroyVC ()

@end

@implementation CPKiloHistroyVC

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CPKiloHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CPKiloHistoryCell"];
    if (nil == cell) {
        cell = [[CPKiloHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CPKiloHistoryCell"];
        cell.clipsToBounds = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColor.clearColor;
        cell.indentationLevel = 3;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"09-12";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    UILabel *titleLB = [header.contentView viewWithTag:1000];
    if (nil == header) {
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
        header.contentView.backgroundColor = UIColor.groupTableViewBackgroundColor;
        
        titleLB = [[UILabel alloc] initWithFrame:header.contentView.bounds];
        titleLB.tag = 1000;
        titleLB.textColor = UIColor.clearColor;
        titleLB.font = [UIFont systemFontOfSize:15];
        titleLB.text = @"09-20";
        
        [header.contentView addSubview:titleLB];
    }

    return header;
}

#pragma mark - load data
- (void)loadData {

    [self.dataTableView.mj_header endRefreshing];
    [self.dataTableView.mj_footer endRefreshing];
    
    self.dataTableView.separatorColor = UIColor.clearColor;
    self.dataTableView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    
    [self.dataTableView reloadData];
}

#pragma mark - Private method implement


@end
