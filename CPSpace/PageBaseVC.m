//
//  PageBaseVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/21.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "PageBaseVC.h"

@interface PageBaseVC ()

@end

@implementation PageBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;//UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight;
    self.automaticallyAdjustsScrollViewInsets = YES;
}

-(void)loadNavigation:(NSString *)title {
    self.title = title;
}

@end
