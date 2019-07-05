//
//  CPRectController.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/11.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPRectController.h"
#import "CPRectCornerButton.h"

@interface CPRectController ()

@end

@implementation CPRectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
}

- (void)setupUI {
    
    CPRectCornerButton *cornerButton = [[CPRectCornerButton alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
//    cornerButton.backgroundColor = UIColor.redColor;
    
    [self.view addSubview:cornerButton];

}


@end
