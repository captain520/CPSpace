//
//  CPTableBaseVC.h
//  CPLibs
//
//  Created by 王璋传 on 2019/2/16.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPBaseVC.h"

@interface CPTableBaseVC : CPBaseVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)loadData;

@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic,strong) UITableView *dataTableView;

@end
