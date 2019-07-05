//
//  CPStepCountVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/11.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPStepCountVC.h"
#import "CPHealthKitManager.h"

@interface CPStepCountVC ()

@end

@implementation CPStepCountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *dict = self.dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",dict[@"date"],dict[@"step"]];

    return cell;
    
}
#pragma mark - load data
- (void)loadData {
    
    __weak typeof(self) weakSelf = self;
    
    [[CPHealthKitManager sharedInstance] authorizeHealthKit:^(BOOL success, NSError *error) {
        if (success) {
            [[CPHealthKitManager sharedInstance] getLast3DaysStepCount:^(NSMutableArray *stepValue, NSError *error) {
                [weakSelf handleLoadDataBlock:stepValue];
            } beforeDays:1 result:@[].mutableCopy];
        }else{
            NSLog(@"=======%@", error.domain);
        }
    }];
}

- (void)handleLoadDataBlock:(NSArray *)results {
    if (results && [results isKindOfClass:[NSArray class]]) {
        self.dataArray  = @[results].mutableCopy;
    } else {
        [self.dataArray removeAllObjects];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.dataTableView reloadData];
    });
}

#pragma mark - Private method implement


@end
