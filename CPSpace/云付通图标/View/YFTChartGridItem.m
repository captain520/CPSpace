//
//  YFTChartGridItem.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "YFTChartGridItem.h"

@implementation YFTChartGridItem

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    {
        _line = [UIView new];
        _line.backgroundColor = UIColor.grayColor;
        
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(1);
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(1);
        }];
    }
}

@end
