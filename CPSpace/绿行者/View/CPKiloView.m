//
//  CPKiloView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/2/18.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPKiloView.h"
#import <Masonry.h>

@implementation CPKiloView {
    UILabel *contentLB;
    
    UIImageView *avaterIV;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    self.layer.cornerRadius = 18;
    
    {
        contentLB = [UILabel new];
        contentLB.text = @"12l45g";
        contentLB.font = [UIFont systemFontOfSize:13];
        contentLB.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:contentLB];
        [contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-18 - 8);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(38);
        }];

        
        avaterIV = [UIImageView new];
        avaterIV.layer.cornerRadius = 16;
        avaterIV.backgroundColor = UIColor.groupTableViewBackgroundColor;
        avaterIV.image = [UIImage imageNamed:@"抓虫"];
        avaterIV.clipsToBounds = YES;
        
        [self addSubview:avaterIV];
        [avaterIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(2);
            make.top.mas_equalTo(2);
            make.bottom.mas_equalTo(-2);
            make.width.mas_equalTo(self->avaterIV.mas_height);
        }];
    }
}

@end
