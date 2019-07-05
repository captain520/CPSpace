//
//  CPButton.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/1.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPImageTitleButton.h"

@interface CPImageTitleButton ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CPImageTitleButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
    }

    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;

    [self updateUI];
}

- (void)setTitleName:(NSString *)titleName
{
    _titleName = titleName;

    [self updateUI];
}

- (void)updateUI
{
    UIView *xLine = [UIView new];
    xLine.backgroundColor = UIColor.whiteColor;

    [self addSubview:xLine];
    [xLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(0);
    }];

    if (nil == self.imageView) {
        self.imageView = [UIImageView new];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(xLine.mas_top).offset(0);
        }];
    }

    _imageView.image = [UIImage imageNamed:self.imageName];

    if (nil == self.titleLabel) {
        self.titleLabel           = [UILabel new];
        self.titleLabel.font      = [UIFont systemFontOfSize:13];
        self.titleLabel.textColor = [UIColor colorWithRed:51. / 255 green:51. / 255 blue:51. / 255 alpha:1];

        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(xLine.mas_bottom).offset(8);
            make.centerX.mas_equalTo(0);
        }];
    }

    _titleLabel.text = self.titleName;
}

@end
