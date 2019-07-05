//
//  YFTChartToastView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "YFTChartToastView.h"

@implementation YFTChartToastView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    _toastLB = [UILabel new];
    _toastLB.clipsToBounds = YES;
    _toastLB.numberOfLines = 0;

    _toastLB.backgroundColor = UIColor.clearColor;
    [self addSubview:_toastLB];
    [_toastLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.top.mas_equalTo(8);
    }];
}

@end
