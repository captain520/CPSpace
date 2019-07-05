//
//  CPSplashVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/4.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPSplashVC.h"

@interface CPSplashVC ()

@property (nonatomic, strong) UIView * splashView;

@end

@implementation CPSplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.splashView.alpha = 0;
    [self.view addSubview:self.splashView];
}

- (UIView *)splashView {
    if (nil == _splashView) {
        _splashView = [[UIView alloc] initWithFrame:self.view.bounds];
        _splashView.backgroundColor = UIColor.blackColor;
    }

    return _splashView;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__FUNCTION__);
    [UIView animateWithDuration:.25 animations:^{
        self.splashView.alpha = 1;
    } completion:^(BOOL finished) {
        self.splashView.alpha = 0;
    }];
}

@end
