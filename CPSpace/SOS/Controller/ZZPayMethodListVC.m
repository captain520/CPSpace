//
//  ZZPayMethodListVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/4.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "ZZPayMethodListVC.h"
#import "CPActionButton.h"

/********************************************** ZZPayMethodListCell ********************************************************/
@interface ZZPayMethodListCell ()

@end

@implementation ZZPayMethodListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    if (nil == self.iconImageView) {
        self.iconImageView = [UIImageView new];
        
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.top.mas_equalTo(12);
            make.bottom.mas_equalTo(-12);
            make.width.mas_equalTo(self->_iconImageView.mas_height);
        }];
    }
    
    if (nil == self.messageLabel) {
        self.messageLabel = [UILabel new];
        self.messageLabel.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
        self.messageLabel.font = [UIFont systemFontOfSize:16];
        
        [self.contentView addSubview:self.messageLabel];
        [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_iconImageView.mas_right).offset(8);
            make.centerY.mas_equalTo(0);
        }];
        
    }
    
    if (nil == self.checkImageView) {
        self.checkImageView = [UIImageView new];
        
        [self.contentView addSubview:self.checkImageView];
        [self.checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-16);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
    }
}

@end

/********************************************** ZZPayMethodListVC ********************************************************/

@interface ZZPayMethodListVC ()

@property (nonatomic, strong) NSIndexPath * selectIndexPath;

@property (nonatomic, strong) CPActionButton *actionButton;

@end

@implementation ZZPayMethodListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self loadData];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.title = @"购买服务套餐";
    self.view.backgroundColor = UIColor.whiteColor;
    
}

#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 5;
            
        default:
            break;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 90;
            break;
        default:
            break;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return [self configPriceCell:indexPath];
            break;
        case 1:
            return [self configPayMethodCell:indexPath];
            break;
        default:
            break;
    }
    return nil;
}

//  配置价格的Cell
- (id)configPriceCell:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [self.dataTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *titleLB = [cell.contentView viewWithTag:1000];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.clipsToBounds = YES;

        titleLB = [UILabel new];
        titleLB.tag = 1000;
        titleLB.textColor = UIColor.redColor;
        
        [cell.contentView addSubview:titleLB];
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
    }
    
    titleLB.attributedText = [self priceAttr:[NSString stringWithFormat:@"%.2f",self.amount]];
    
    return cell;
}

//  配置支付方式的cell
- (id)configPayMethodCell:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"ZZPayMethodListCell";
    
    ZZPayMethodListCell *cell = [self.dataTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[ZZPayMethodListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    

    switch (indexPath.row) {
        case 0:
        {
            cell.iconImageView.image = [UIImage imageNamed:@"pay_weixin_icon"];
            cell.messageLabel.text = @"微信支付";
        }
            break;
        case 1:
        {
            cell.iconImageView.image = [UIImage imageNamed:@"pay_alipay_icon"];
            cell.messageLabel.text = @"支付宝支付";
        }
            break;
        case 2:
        {
            cell.iconImageView.image = [UIImage imageNamed:@"payment_Bestpay"];
            cell.messageLabel.text = @"翼支付";
        }
            break;
        case 3:
        {
            cell.iconImageView.image = [UIImage imageNamed:@"payment_CMBpay"];
            cell.messageLabel.text = @"一网通银行卡";
        }
            break;
        case 4:
        {
            cell.iconImageView.image = [UIImage imageNamed:@"payment_myPurse"];
            cell.messageLabel.text = @"余额支付";
        }
            break;

        default:
            break;
    }
    
    if (nil == self.selectIndexPath ) {
        if (0 == indexPath.row && 1 == indexPath.section) {
            self.selectIndexPath = indexPath;
        }
    }

    if (indexPath == self.selectIndexPath) {
        cell.checkImageView.image = [UIImage imageNamed:@"zhifu_check1"];
    } else {
        cell.checkImageView.image = [UIImage imageNamed:@"zhifu_check2"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 == indexPath.section) {
        return;
    }
    
    self.selectIndexPath = indexPath;
    
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - load data
- (void)loadData {
    self.tableViewStyle = UITableViewStyleGrouped;
    [self.dataTableView reloadData];
    
    if (nil == self.actionButton) {
        self.actionButton = [CPActionButton new];
        [self.actionButton setTitle:@"支付" forState:UIControlStateNormal];
        [self.actionButton addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.actionButton];
        [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.height.mas_equalTo(40);
            make.right.mas_equalTo(-16);
            make.bottom.mas_equalTo(-UIApplication.sharedApplication.statusBarFrame.size.height);
        }];
    }
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (NSAttributedString *)priceAttr:(NSString *)price {
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"¥" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
    NSAttributedString *priceAttr = [[NSMutableAttributedString alloc] initWithString:price attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30]}];
    [attr appendAttributedString:priceAttr];
    
    return attr;
}
- (void)payAction:(id)sender {
   NSLog(@"%s", __FUNCTION__);
}


@end
