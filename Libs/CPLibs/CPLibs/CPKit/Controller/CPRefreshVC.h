//
//  CPRefreshVC.h
//  CPLibs
//
//  Created by 王璋传 on 2019/2/16.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTableBaseVC.h"
#import <MJRefresh.h>

@interface CPRefreshVC : CPTableBaseVC

@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger pageSize;  //  默认size为每页10条数据

@end
