//
//  CPCoreBlueToothVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/7/2.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPCoreBlueToothVC.h"
#import "CPPeriperalVC.h"
#import "CPCentralVC.h"

const NSString * const service_id = @"test_Ble";

@interface CPCoreBlueToothVC ()

@end

@implementation CPCoreBlueToothVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}

#pragma mark - UITbaleviewCellDelegatet & UITableViewCellDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row) {
        [self.navigationController pushViewController:CPPeriperalVC.new animated:YES];
    } else if (1 == indexPath.row) {
        [self.navigationController pushViewController:CPCentralVC.new animated:YES];
    }
}

- (void)loadData {
    self.dataArray = @[
                       @[@"主机",@"从机"]
                       ].mutableCopy;
    
    [self.dataTableView reloadData];
}

@end
