//
//  ZZSOSEntryVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/1.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "ZZSOSEntryVC.h"
#import "CPImageTitleButton.h"
#import "ZZSOSItemsView.h"
#import "ZZBuyPackageVC.h"
#import "CPPackageInfoVC.h"

@interface ZZSOSEntryVC ()

@property (nonatomic, strong) CPImageTitleButton *actionButton;
@property (nonatomic, strong) ZZSOSItemsView *sosItemsView;
@property (nonatomic, strong) UIImageView *bgImageView;

@end

@implementation ZZSOSEntryVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties
{
    self.view.backgroundColor = UIColor.redColor;
}

#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI
{
    if (nil == _bgImageView) {
        self.bgImageView = [[UIImageView alloc] init];
        self.bgImageView.image = [UIImage imageNamed:@"sos_bg_longScreen"];

        [self.view addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(UIScreen.mainScreen.bounds.size.width * 2033. / 1125);
        }];
    }

    if (nil == _sosItemsView) {
        __weak typeof(self)weakSelf = self;

        _sosItemsView = [ZZSOSItemsView new];
        _sosItemsView.type = CPSOSItemActionTypeUnBuy;
        _sosItemsView.actionBlock = ^(NSUInteger tag) {
            [weakSelf handleAcitonBlock:tag];
        };

        [self.view addSubview:_sosItemsView];
        [_sosItemsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(160);
        }];
    }
}

#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData
{
}

- (void)handleLoadDataBlock:(NSArray *)results
{
}

#pragma mark - Private method implement
- (void)buttionAction:(id)sender
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)handleAcitonBlock:(NSUInteger)tag
{
    switch (tag) {
        case 1000:
            break;
        case 1001:
            break;
        case 1002:
            break;
        case 1003:
            break;
        case 1004: {
            [self.navigationController pushViewController:CPPackageInfoVC.new animated:YES];
        }
        break;

        default:
            break;
    }
}

@end
