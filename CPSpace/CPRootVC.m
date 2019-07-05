//
//  CPRootVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/2/16.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPRootVC.h"
#import <UMSSDKUI/UMSLoginViewController.h>
#import <UMSSDKUI/UMSLoginModuleViewController.h>
#import <UMSSDKUI/UMSProfileModuleViewController.h>
#import <UMSSDKUI/UMSProfileViewController.h>
#import "CPImageShowVC.h"
#import "CPLockVC.h"

@interface CPRootVC ()

@end

@implementation CPRootVC

- (void)viewDidLoad {
    

    [[NSUserDefaults standardUserDefaults] setObject:@"111111111" forKey:@"bbbbbbbbbb"];
    
    self.tableViewStyle = UITableViewStyleGrouped;

    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initailizeBaseProperties];
    [self setupUI];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.tableViewStyle = UITableViewStyleGrouped;
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    [self setTitle:@"功能首页"];
}
#pragma mark - Delegate && dataSource method implement

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UITabtelViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row][@"titleName"];
    cell.detailTextLabel.text = self.dataArray[indexPath.section][indexPath.row][@"titleName"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    __weak typeof(self) weakSelf = self;
//
//    switch (indexPath.section) {
//        case 0:
//        {
////            UMSLoginViewController *loginVC = [[UMSLoginViewController alloc] init];
////            loginVC.loginHandler = ^(NSError *error) {
////                [weakSelf handleLoginBlock:error];
////            };
//
//            UMSLoginModuleViewController *loginVC = [[UMSLoginModuleViewController alloc] init];
//            loginVC.loginVC.loginHandler = ^(NSError *error) {
//                [weakSelf handleLoginBlock:error];
//            };
//
//            [self presentViewController:loginVC animated:YES completion:^{
//
//            }];
////            [self.navigationController pushViewController:loginVC animated:YES];
//        }
//            break;
//        case 1:
//        {
//            UMSProfileViewController *profileVC = [[UMSProfileViewController alloc] init];
//
//            [self.navigationController pushViewController:profileVC animated:YES];
//        }
//            break;
//
//        default:
//            break;
//    }
//
    
#if 1
    NSString *className = self.dataArray[indexPath.section][indexPath.row][@"className"];
    NSString *titleName = self.dataArray[indexPath.section][indexPath.row][@"titleName"];

    [self pushVCWithClassString:className title:titleName];
#else
    
#endif
    
//    CPImageShowVC *vc = [[CPImageShowVC alloc] init];
//
//    [self presentViewController:vc animated:YES completion:^{
//
//    }];
}
#pragma mark - load data
- (void)loadData {
    
    [super loadData];
    
    self.dataArray = @[
                       @[@{ @"className" : @"CPTestVC", @"titleName" : @"测试"}],
                       @[@{ @"className" : @"CPSortVC", @"titleName" : @"排序"}],
                       @[@{ @"className" : @"CPCoreBlueToothVC", @"titleName" : @"蓝牙"}],
                       @[@{ @"className" : @"CPBLEVC", @"titleName" : @"BLE"}],
                       @[@{ @"className" : @"CPImagePickerDemoVC", @"titleName" : @"调用相机"}],
                       @[@{ @"className" : @"CPShareTestVC", @"titleName" : @"分享文件"}],
                       @[@{ @"className" : @"CPRecordVC", @"titleName" : @"录音功能"}],
                       @[@{ @"className" : @"CPYFTChartVC", @"titleName" : @"云付通图表"}],
                       @[@{ @"className" : @"CPTextViewVC", @"titleName" : @"文本输入"}],
                       @[@{ @"className" : @"CPSelectCarDistrictVC", @"titleName" : @"车牌省份"}],
                       @[@{ @"className" : @"CPRectController", @"titleName" : @"异性按钮"}],
                       @[@{ @"className" : @"CPFlipAnimationVC", @"titleName" : @"翻转动画"}],
                       @[@{ @"className" : @"MSVLCPlayerVC", @"titleName" : @"简单播放器"}],
                       @[@{ @"className" : @"CPAttributeVC", @"titleName" : @"富文本"}],
                       @[@{ @"className" : @"CPVIPServiceMainVC", @"titleName" : @"VIP服务"}],
                       @[@{ @"className" : @"CPSuccessFailTestVC", @"titleName" : @"成功失败测试"}],
                       @[@{ @"className" : @"CPActionSheetTestVC", @"titleName" : @"ActionSheet测试"}],
                       @[@{ @"className" : @"CPSplashVC", @"titleName" : @"拍照闪屏"}],
                       @[@{ @"className" : @"CPStretchImageVC", @"titleName" : @"图片拉伸"}],
                       @[@{ @"className" : @"CPCPAnimation2VC", @"titleName" : @"Bezier动画"}],
                       @[@{ @"className" : @"ZZSOSEntryVC", @"titleName" : @"SOS"}],
                       @[@{ @"className" : @"CPMutilThreadVC", @"titleName" : @"多线程"}],
                       @[@{ @"className" : @"CPSemaphoreVC", @"titleName" : @"信号量"}],
                       @[@{ @"className" : @"CPVLCPlayer", @"titleName" : @"播放器"}],
                       @[@{ @"className" : @"CPGWProfileVC", @"titleName" : @"技能减排我的"}],
                       @[@{ @"className" : @"CPJSOCInterActionVC", @"titleName" : @"js与OC交互"}],
                       @[@{ @"className" : @"CPGWCertificateVC", @"titleName" : @"我的证书"}],
                       @[@{ @"className" : @"CPGKEnterVC", @"titleName" : @"绿行者入口"}],
                       @[@{ @"className" : @"UMSLoginViewController", @"titleName" : @"title"}],
                       @[@{ @"className" : @"UMSProfileModuleViewController", @"titleName" : @"个人信息界面"}],
                       @[@{ @"className" : @"CPGreenWalkerVC", @"titleName" : @"绿行者"}],
                       @[@{ @"className" : @"CPKiloHistroyVC", @"titleName" : @"动态"}],
                       @[@{ @"className" : @"CPPlayerVC", @"titleName" : @"播放器"}],
                       @[@{ @"className" : @"CPStepCountVC", @"titleName" : @"计步器"}],
                       @[@{ @"className" : @"CPPaoPaoVC", @"titleName" : @"泡泡"}],
                       @[@{ @"className" : @"CPImageShowVC", @"titleName" : @"图片查看器"}],
                       @[@{ @"className" : @"CPSearhViewVC", @"titleName" : @"自定义搜索框"}],
                       @[@{ @"className" : @"CPConstraintVC", @"titleName" : @"约束"}],
                       @[@{ @"className" : @"CPLockVC", @"titleName" : @"锁"}],
                       ].mutableCopy;
    
    [self.dataTableView reloadData];
}


#pragma mark - Private method implement

- (void)handleLoginBlock:(NSError *)error {
    if (!error) {
//        [self.navigationController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    } else {
        
    }
}




@end
