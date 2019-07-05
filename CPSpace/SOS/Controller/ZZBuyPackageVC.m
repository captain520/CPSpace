//
//  ZZBuyPackageVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/1.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "ZZBuyPackageVC.h"
#import "ZZSendCodeButton.h"
#import "CPActionButton.h"
#import "ZZPayMethodListVC.h"


/********************************************** ZZBuyPackageCell ******************************************************/

@interface ZZBuyPackageCell ()

@property (nonatomic, strong) ZZSendCodeButton * sendCodeButton;
@property (nonatomic, strong) UIButton * scanButton;

@end

@implementation ZZBuyPackageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    if (nil == self.hintLabel) {
        self.hintLabel = [UILabel new];
        self.hintLabel.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
        self.hintLabel.font = [UIFont systemFontOfSize:16];
        self.hintLabel.text = @"设备IMEI号";

        [self.contentView addSubview:self.hintLabel];
        [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(85);
        }];
    }
    
    if (nil == self.inputMessageTF) {
        self.inputMessageTF = [UITextField new];
        self.inputMessageTF.font = [UIFont systemFontOfSize:16];
        
        [self.contentView addSubview:self.inputMessageTF];
        [self.inputMessageTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(self->_hintLabel.mas_right).offset(8);
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(100);
            make.bottom.mas_equalTo(0);
        }];
    }
    

}

- (void)setType:(ZZBuyPackageCellInputType)type {
    _type = type;
    
    switch (type) {
        case ZZBuyPackageCellInputTypeNumber:
            self.inputMessageTF.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case ZZBuyPackageCellInputTypeDefault:
            self.inputMessageTF.keyboardType = UIKeyboardTypeDefault;
            break;
            
        default:
            break;
    }
}

- (void)setNeedSendeCode:(BOOL)needSendeCode {
    _needSendeCode = needSendeCode;
    if (YES == needSendeCode) {

        if (nil != self.scanButton) {
            [self.scanButton removeFromSuperview];
            self.scanButton.hidden = YES;
        }

        if (nil == self.sendCodeButton) {
            self.sendCodeButton = [ZZSendCodeButton new];
            self.sendCodeButton.backgroundColor = UIColor.redColor;
//            [self.sendCodeButton setTitleColor:[UIColor colorWithRed:3./255 green:169./255 blue:244./255 alpha:1] forState:UIControlStateNormal];
            
            [self.contentView addSubview:self.sendCodeButton];
            [self.sendCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-8);
                make.height.mas_equalTo(40);
                make.centerY.mas_equalTo(0);
                make.width.mas_equalTo(80);
            }];
        }
    }
}

- (void)setNeedScanIMEI:(BOOL)needScanIMEI {
    _needScanIMEI = needScanIMEI;
    
    if (YES == needScanIMEI ) {
        if (nil != self.sendCodeButton) {
            [self.sendCodeButton removeFromSuperview];
            self.sendCodeButton.hidden = YES;
        }
        
        if (nil == self.scanButton) {
            self.scanButton = [UIButton new];

            [self.scanButton setImage:[UIImage imageNamed:@"saomiao"] forState:UIControlStateNormal];
            [self.contentView addSubview:self.scanButton];
            [self.scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-8);
                make.height.mas_equalTo(40);
                make.centerY.mas_equalTo(0);
                make.width.mas_equalTo(80);
            }];
        }
    }
}

- (void)setNoAction:(BOOL)noAction {
    _noAction = noAction;
    
    self.sendCodeButton.hidden = YES;
    self.scanButton.hidden = YES;
}

@end


/********************************************** ZZBuyPackageActionView ******************************************************/
@interface ZZBuyPackageActionView ()



@end

@implementation ZZBuyPackageActionView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    if (nil == self.actionButton) {
        self.actionButton = [CPActionButton new];
        self.actionButton.layer.cornerRadius = 0;
        [self.actionButton setTitle:@"提交并前往支付" forState:UIControlStateNormal];

        [self addSubview:self.actionButton];
        [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(140);
        }];
    }
    
    if (nil == self.amountLabel) {
        self.amountLabel = [UILabel new];
        self.amountLabel.numberOfLines = 0;
        self.amountLabel.attributedText = [self salePrice:@"128.00" marketPrice:@"198"];

        [self addSubview:self.amountLabel];
        [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(16);
            make.bottom.mas_equalTo(0);
//            make.width.mas_equalTo(100);
        }];
    }
}

- (NSAttributedString *)salePrice:(NSString *)salePrice marketPrice:(NSString *)markPrice {
    
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.alignment = NSTextAlignmentCenter;
    p.lineSpacing = 5;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"合计：" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1]}];
    
    NSAttributedString *salePriceAttr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%.2f\n",salePrice.floatValue] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],NSForegroundColorAttributeName : UIColor.redColor}];
    [attr appendAttributedString:salePriceAttr];

    NSAttributedString *marketHintAttr = [[NSMutableAttributedString alloc] initWithString:@"原价：¥" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1]}];
    [attr appendAttributedString:marketHintAttr];
    
    NSAttributedString *marketPriceAttr = [[NSAttributedString alloc] initWithString:markPrice attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSStrikethroughStyleAttributeName : @1,NSForegroundColorAttributeName : [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1]}];
    [attr appendAttributedString:marketPriceAttr];

    [attr addAttribute:NSParagraphStyleAttributeName value:p range:NSMakeRange(0, attr.length)];
    
    return attr;
}

@end

/********************************************** ZZBuyPackageVC ******************************************************/

@interface ZZBuyPackageVC ()

@property (nonatomic, strong) NSArray <NSString *> *hintMsgList;
@property (nonatomic, strong) NSArray <NSString *> *placeholderMsgList;

@property (nonatomic, strong) ZZBuyPackageActionView *actionView;

@end

@implementation ZZBuyPackageVC

- (void)viewDidLoad {
    
    self.tableViewStyle = UITableViewStyleGrouped;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initailizeBaseProperties];
    
    [self loadData];
    self.dataTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.hintMsgList = @[
                         @"车牌号",
                         @"车架号",
                         @"发动机号",
                         @"车主电话",
                         @"输入验证码",
                         @"设备IMEI号"
                         ];
    
    self.placeholderMsgList = @[
                                @"请输入车牌号",
                                @"请输入车架号",
                                @"请输入发动机号",
                                @"请输入车主电话",
                                @"请输入验证码",
                                @"请扫描或输入设备号"
                                ];
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    if (nil == self.actionView) {
        self.actionView = [ZZBuyPackageActionView new];
        
        [self.view addSubview:self.actionView];
        [self.actionView.actionButton addTarget:self action:@selector(push2PayVC:) forControlEvents:UIControlEventTouchUpInside];
        [self.actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(60);
        }];
    }
}
#pragma mark - Delegate && dataSource method implement
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hintMsgList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ZZBuyPackageCell";
    
    ZZBuyPackageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[ZZBuyPackageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, -15, 0, 0);
    }
    
    cell.hintLabel.text = self.hintMsgList[indexPath.row];
    cell.inputMessageTF.placeholder = self.placeholderMsgList[indexPath.row];
    if (indexPath.row == 0 || indexPath.row == 1) {
        cell.type = ZZBuyPackageCellInputTypeDefault;
    } else {
        cell.type = ZZBuyPackageCellInputTypeNumber;
    }
    
    if (4 == indexPath.row) {
        cell.needSendeCode = YES;
    } else if (5 == indexPath.row) {
        cell.needScanIMEI = YES;
    } else {
        cell.noAction = YES;
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    static NSString *footerIdentifier = @"footer";
    
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdentifier];
    UIButton *agreeProtocolButton = [footer.contentView viewWithTag:1000];
    if (nil ==  footer) {
        footer = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:footerIdentifier];
        footer.clipsToBounds = YES;

        agreeProtocolButton = [UIButton new];
        agreeProtocolButton.tag = 100;
        agreeProtocolButton.titleLabel.numberOfLines = 2;
        [agreeProtocolButton setAttributedTitle:[self protocolAttrTitle] forState:UIControlStateNormal];
        [agreeProtocolButton setImage:[UIImage imageNamed:@"zhifu_check1"] forState:UIControlStateNormal];
        [agreeProtocolButton setImage:[UIImage imageNamed:@"zhifu_check2"] forState:UIControlStateSelected];
        [footer.contentView addSubview:agreeProtocolButton];
        [agreeProtocolButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(16);
            make.centerX.mas_equalTo(0);
        }];
        
        UILabel *hintLabel = [UILabel new];
        hintLabel.text = @"温馨提示：服务在购买成功后24小时后生效";
        hintLabel.font = [UIFont systemFontOfSize:14];
        hintLabel.textColor = [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1];
        
        [footer.contentView addSubview:hintLabel];
        [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(agreeProtocolButton.mas_bottom).offset(10);
            make.centerX.mas_equalTo(0);
        }];
    }
    
    return footer;
}

- (NSAttributedString *)protocolAttrTitle {
    NSString *str = @"  提交即代表您同意《救援服务协议》";
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1]}];
    
    [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:3./255 green:169./255 blue:244./255 alpha:1] range:NSMakeRange(10, 8)];

    return attr;
}

#pragma mark - load data
- (void)loadData {
    [super loadData];
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement
- (void)push2PayVC:(id)sender {
    
    ZZPayMethodListVC *vc = [[ZZPayMethodListVC alloc] init];
    vc.amount = 11;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
