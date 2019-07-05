//
//  CPTest2VC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/25.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTest2VC.h"
#import "NSObject+AssociatedObject.h"

@interface CPTest2VC ()

@end

@implementation CPTest2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
//    button.backgroundColor = UIColor.redColor;
//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:button

}

- (void)buttonAction:(id)sender {
    !self.actionBlock ? : self.actionBlock();
}

@end
