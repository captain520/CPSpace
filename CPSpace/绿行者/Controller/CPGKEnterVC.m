//
//  CPGKEnterVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/21.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPGKEnterVC.h"

#import <SDCycleScrollView.h>

@interface CPGKEnterVC ()

@property (nonatomic, strong) SDCycleScrollView * adSV;
@property (nonatomic, strong) CPGKEnterHintView * hintView;
@property (nonatomic, strong) UIButton * actionButton;

@end

@implementation CPGKEnterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
}

#pragma mark - setter && getter method
- (SDCycleScrollView *)adSV {
    
    if (nil == _adSV) {
        CGFloat width = UIScreen.mainScreen.bounds.size.width;
        _adSV = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, width, width * 374 / 750) imageNamesGroup:@[[UIImage imageNamed:@"节能减排banner.jpg"]]];
    }
    
    return _adSV;
}

- (CPGKEnterHintView *)hintView {
    
    if (nil == _hintView) {
        
        CGFloat width = UIScreen.mainScreen.bounds.size.width;
        
        _hintView = [[CPGKEnterHintView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_adSV.bounds) + 8, width, 150)];
        _hintView.backgroundColor = UIColor.whiteColor;
    }
    
    return _hintView;
}

#pragma mark - Setup UI
- (void)setupUI {
    
    [self loadNavigation:@"节能减排"];
    
    [self.view addSubview:self.adSV];
    [self.view addSubview:self.hintView];
    
    if (nil == self.actionButton) {
        self.actionButton = [[UIButton alloc] init];
        self.actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        self.actionButton.layer.cornerRadius = 3.0f;
        self.actionButton.clipsToBounds = YES;
        
        [self.actionButton addTarget:self action:@selector(applyAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.actionButton setTitle:@"我要参与" forState:UIControlStateNormal];
        [self.actionButton setBackgroundColor:UIColor.blueColor];
        [self.view addSubview:self.actionButton];
        [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_hintView.mas_bottom).offset(32);
            make.left.mas_equalTo(16);
            make.right.mas_equalTo(-16);
            make.height.mas_equalTo(30);
        }];
    }
    
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (void)applyAction:(id)sender {
    NSLog(@"%s", __FUNCTION__);
}

@end


@interface CPGKEnterHintView ()

@property (nonatomic, strong) UILabel * titleLB;
@property (nonatomic, strong) UILabel * contentLB;

@end

@implementation CPGKEnterHintView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {

    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLB.backgroundColor = UIColor.whiteColor;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.text = @"与北京环交所联合打造，绿色环保";
        _titleLB.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
        _titleLB.font = [UIFont boldSystemFontOfSize:16];
        
        [self addSubview:_titleLB];
        
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
            make.height.mas_equalTo(40);
        }];
    }
    
    UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(16, 30, 40, 1)];
    leftLine.backgroundColor = UIColor.lightGrayColor;
    [self addSubview:leftLine];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(self->_titleLB.mas_left).offset(-8);
        make.centerY.mas_equalTo(self->_titleLB.mas_centerY);
        make.height.mas_equalTo(1);
    }];

    UIView *rightLine = [[UIView alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width - 16 - 40, 30, 40, 1)];
    rightLine.backgroundColor = UIColor.lightGrayColor;
    [self addSubview:rightLine];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_titleLB.mas_right).offset(8);
        make.right.mas_equalTo(-16);
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(self->_titleLB.mas_centerY);
    }];
    
    if (_contentLB == nil) {
        _contentLB = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(_titleLB.bounds), UIScreen.mainScreen.bounds.size.width - 32, 100)];
        _contentLB.backgroundColor = UIColor.whiteColor;
        _contentLB.numberOfLines = 3;
        _contentLB.textColor = UIColor.grayColor;

        [self addSubview:_contentLB];
        [_contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_titleLB.mas_bottom);
            make.left.mas_equalTo(16);
            make.right.mas_equalTo(-16);
            make.bottom.mas_equalTo(-16);
        }];
    }
    
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.lineSpacing = 8;

    NSString *str = @"安装智能ETC设备\n参与绿色环保，节能减排\n少开一天车，节能有我，绿色共享!";
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:str attributes:@{NSForegroundColorAttributeName : UIColor.grayColor, NSFontAttributeName : [UIFont systemFontOfSize:15], NSParagraphStyleAttributeName : p}];
    _contentLB.attributedText = attr;

}


@end
