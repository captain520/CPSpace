//
//  CPKiloHistoryCell.m
//  CPSpace
//
//  Created by 王璋传 on 2019/2/19.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPKiloHistoryCell.h"
#import <Masonry.h>

#define TREE_GREEN_COLOR [UIColor colorWithRed:27./255 green:164./255 blue:113./255 alpha:1]

@implementation CPKiloHistoryCell {
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    {
        self.vLine = [UIView new];
        self.vLine.backgroundColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.vLine];
        [self.vLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16 * 2);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(.5);
        }];
    }
    
    
    {
        self.dotLine = [UIView new];
        self.dotLine.backgroundColor = [UIColor grayColor];
        self.dotLine.layer.cornerRadius = 3;

        [self.contentView addSubview:self.dotLine];
        [self.dotLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.vLine.mas_centerX);
            make.centerY.mas_equalTo(self.vLine.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(6, 6));
        }];
    }
    
    {
        self.timeLB = [UILabel new];
        self.timeLB.text = @"07：14";
        self.timeLB.font = [UIFont systemFontOfSize:11];
        self.timeLB.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.timeLB];
        [self.timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.dotLine.mas_right).offset(8);
            make.centerY.mas_equalTo(self.dotLine.mas_centerY);
        }];
    }
    
    {
        _avaterIV = [UIImageView new];
        _avaterIV.layer.cornerRadius = 12;
        _avaterIV.backgroundColor = UIColor.groupTableViewBackgroundColor;
        _avaterIV.image = [UIImage imageNamed:@"抓虫"];
        _avaterIV.clipsToBounds = YES;
        
        [self addSubview:_avaterIV];
        [_avaterIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.timeLB.mas_right).offset(16);
            make.centerY.mas_equalTo(self.timeLB.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
    }
    
    {
        _nameLB = [UILabel new];
        _nameLB.text = @"隔壁小王";
        _nameLB.font = [UIFont boldSystemFontOfSize:14];
        
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.avaterIV.mas_right).offset(2);
            make.centerY.mas_equalTo(self.avaterIV.mas_centerY);
        }];
    }
    
    {
        _actionLB = [UILabel new];
        _actionLB.text = @"收取2g";
        _actionLB.font = [UIFont systemFontOfSize:13];
        
        [self.contentView addSubview:_actionLB];
        [_actionLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLB.mas_right).offset(4);
            make.centerY.mas_equalTo(self.avaterIV.mas_centerY);
        }];
    }
    
    {
        _prizeBT = [UIButton new];
        _prizeBT.titleLabel.font = [UIFont systemFontOfSize:9];
        _prizeBT.layer.borderColor = TREE_GREEN_COLOR.CGColor;
        _prizeBT.layer.borderWidth = .5f;
        _prizeBT.layer.cornerRadius = 9;

        [_prizeBT setTitle:@"打赏" forState:UIControlStateNormal];
        [_prizeBT setTitleColor:TREE_GREEN_COLOR forState:UIControlStateNormal];
        [_prizeBT setTitle:@"已赏" forState:UIControlStateSelected];
        [_prizeBT setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
        [_prizeBT addTarget:self action:@selector(prizeAction:) forControlEvents:UIControlEventTouchUpInside];
        [_prizeBT setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];

        [self.contentView addSubview:self.prizeBT];
        
        [_prizeBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.actionLB.mas_right).offset(4);
            make.centerY.mas_equalTo(self.avaterIV.mas_centerY);
            make.width.mas_equalTo(36);
            make.height.mas_equalTo(18);
        }];
    }
    
    {
        self.kiloLB = [UILabel new];
        self.kiloLB.font = [UIFont systemFontOfSize:11];
        self.kiloLB.text = @"1g";
        self.kiloLB.textColor = TREE_GREEN_COLOR;
        self.kiloLB.layer.cornerRadius = 11;
        self.kiloLB.clipsToBounds = YES;
        self.kiloLB.backgroundColor = [UIColor colorWithRed:189./255 green:249./255 blue:57./255 alpha:1];
        self.kiloLB.textAlignment = NSTextAlignmentCenter;

        [self.contentView addSubview:self.kiloLB];
        [self.kiloLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.prizeBT.mas_right).offset(-10);
            make.centerY.mas_equalTo(self.avaterIV.mas_centerY);
            make.height.mas_equalTo(22);
            make.width.mas_equalTo(self.kiloLB.mas_height);
        }];
    }
}

- (void)prizeAction:(id)sender {
    NSLog(@"%s",__func__);
}

@end
