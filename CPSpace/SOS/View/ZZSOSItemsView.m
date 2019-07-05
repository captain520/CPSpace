//
//  ZZSOSItemsView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/1.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "ZZSOSItemsView.h"

@implementation ZZSOSItemsView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.groupTableViewBackgroundColor;
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    CPImageTitleButton *lifeSOS = [CPImageTitleButton new];
    lifeSOS.imageName = @"sos_lifeHelp_icon";
    lifeSOS.titleName = @"生命救援";
    lifeSOS.tag = 1000;
    
    [self addSubview:lifeSOS];
    [lifeSOS addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [lifeSOS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(75);
    }];
    
    
    CPImageTitleButton *roadSOS = [CPImageTitleButton new];
    roadSOS.imageName = @"sos_roadHelp_icon";
    roadSOS.titleName = @"道路救援";
    roadSOS.tag = 1001;
    
    [self addSubview:roadSOS];
    [roadSOS addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [roadSOS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(lifeSOS.mas_right);
        make.height.mas_equalTo(75);
        make.width.mas_equalTo(lifeSOS.mas_width);
    }];

    
    CPImageTitleButton *accidentSOS = [CPImageTitleButton new];
    accidentSOS.imageName = @"sos_information_icon";
    accidentSOS.titleName = @"事故协助";
    accidentSOS.tag = 1002;
    
    [self addSubview:accidentSOS];
    [accidentSOS addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [accidentSOS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(roadSOS.mas_right);
        make.height.mas_equalTo(75);
        make.width.mas_equalTo(lifeSOS.mas_width);
    }];
    
    
    CPImageTitleButton *trafficSOS = [CPImageTitleButton new];
    trafficSOS.imageName = @"sos_breakRrules_icon";
    trafficSOS.titleName = @"违章查询";
    trafficSOS.tag = 1003;
    
    [self addSubview:trafficSOS];
    [trafficSOS addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [trafficSOS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(accidentSOS.mas_right);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(75);
        make.width.mas_equalTo(lifeSOS.mas_width);
    }];
    
    if (nil == self.actionButton) {
        self.actionButton = [CPActionButton new];
        self.actionButton.tag = 1004;
        
        [self addSubview:self.actionButton];
        [self.actionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-16);
            make.height.mas_equalTo(40);
            make.centerY.mas_offset(75./2);
            make.width.mas_equalTo(100);
        }];
    }
    
    if (nil == self.hintLabel) {
        self.hintLabel = [UILabel new];
        self.hintLabel.numberOfLines = 0;
        
        [self addSubview:self.hintLabel];
        [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(32);
            make.top.mas_equalTo(75);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(self->_actionButton.mas_left).offset(-32);
        }];
    }
}

- (void)buttonAction:(UIControl *)sender {
    NSLog(@"%s tag:%ld", __FUNCTION__,sender.tag);
    
    !self.actionBlock ? : self.actionBlock(sender.tag);
}

- (void)setActionTittle:(NSString *)actionTittle {
    _actionTittle = actionTittle;
    
    [self.actionButton setTitle:actionTittle forState:UIControlStateNormal];
}

- (void)setType:(CPSOSItemActionType)type {
    _type = type;
    
    switch (type) {
        case CPSOSItemActionTypeUnBuy:
        {
            self.hintMessage = @"您还未得到服务保障，赶快购买，可以享受全国道路救援功能!";
            self.actionTittle = @"立即购买";
        }
            break;
        case CPSOSItemActionTypeUnPaid:
        {
            self.hintMessage = @"您还有未支付的服务套餐订单，请前往支付，可以享受全国道路救援功能!";
            self.actionTittle = @"立即支付";
        }
            break;
        case CPSOSItemActionTypePaid:
        {
            self.hintMessage = @"您已经获得服务保障，可以享受全国道路救援功能!";
            self.actionTittle = @"立即购买";
            
            if (nil == _maskImageView) {
                _maskImageView = [UIImageView new];
                _maskImageView.image = [UIImage imageNamed:@"usefulLife_bg"];
                
                [self addSubview:_maskImageView];
                [_maskImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self->_actionButton.mas_top).offset(-4);
                    make.left.mas_equalTo(self->_actionButton.mas_left).offset(-8);
                    make.right.mas_equalTo(self->_actionButton.mas_right).offset(4);
                    make.bottom.mas_equalTo(self->_actionButton.mas_bottom).offset(4);
                }];
                
            }
            
        }
            break;
        case CPSOSItemActionTypeOverDue:
        {
            self.hintMessage = @"您还未得到服务保障，赶快购买，可以享受全国道路救援功能!";
            self.actionTittle = @"立即购买";
        }
            break;
        case CPSOSItemActionTypeReserved:
        {
            self.hintMessage = @"您还未得到服务保障，赶快购买，可以享受全国道路救援功能!";
            self.actionTittle = @"立即购买";
        }
            break;
        default:
            break;
    }
    
    [self updateUI];
}

- (void)updateUI {
    [self.actionButton setTitle:self.actionTittle forState:UIControlStateNormal];
    self.hintLabel.attributedText = [self getMessageAttr:self.hintMessage];
}

- (NSAttributedString *)getMessageAttr:(NSString *)message {
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.lineSpacing = 5;
    
    UIColor *color = [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1];
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:message attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11],NSForegroundColorAttributeName : color,NSParagraphStyleAttributeName : p}];
    
    return attr;
}

@end
