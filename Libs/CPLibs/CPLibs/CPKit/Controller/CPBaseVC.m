//
//  CPBaseVC.m
//  CPLibs
//
//  Created by 王璋传 on 2019/2/16.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPBaseVC.h"

@interface CPBaseVC ()

@end

@implementation CPBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushVCWithClassString:(NSString *)classString title:(NSString *)title {
    
    if (!classString) {
        return;
    }
    
    Class DestClass = NSClassFromString(classString);
    
    UIViewController *vc = [DestClass new];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = title;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
