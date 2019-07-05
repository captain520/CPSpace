//
//  CPPackageInfoVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/2.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPPackageInfoVC.h"
#import "CPActionButton.h"
#import "ZZBuyPackageVC.h"

@interface ZZPriceCell ()

@property (nonatomic, strong) UILabel * contentLB;

@end

@implementation ZZPriceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    if (nil == self.contentLB) {
        self.contentLB = [UILabel new];
        self.contentLB.textAlignment = NSTextAlignmentCenter;
        self.contentLB.numberOfLines = 2;
        self.contentLB.attributedText = [self salePrice:@"128" marketPrice:@"198"];

        [self.contentView addSubview:self.contentLB];
        [self.contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
}

- (NSAttributedString *)salePrice:(NSString *)salePrice marketPrice:(NSString *)markPrice {
    
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.alignment = NSTextAlignmentCenter;
    p.lineSpacing = 10;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"优惠价：¥" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}];
    NSAttributedString *salePriceAttr = [[NSAttributedString alloc] initWithString:salePrice attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:24]}];
    [attr appendAttributedString:salePriceAttr];
    
    NSAttributedString *unitAttr = [[NSAttributedString alloc] initWithString:@"（元/年）\n" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1]}];
    [attr appendAttributedString:unitAttr];
    
    NSAttributedString *marketHintAttr = [[NSMutableAttributedString alloc] initWithString:@"原价：¥" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}];
    [attr appendAttributedString:marketHintAttr];
    
    NSAttributedString *marketPriceAttr = [[NSAttributedString alloc] initWithString:markPrice attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15],NSStrikethroughStyleAttributeName : @1}];
    [attr appendAttributedString:marketPriceAttr];
    
    NSAttributedString *unitAttr1 = [[NSAttributedString alloc] initWithString:@"（元/年）" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1]}];
    [attr appendAttributedString:unitAttr1];

    [attr addAttribute:NSParagraphStyleAttributeName value:p range:NSMakeRange(0, attr.length)];
    
    return attr;
}

@end

/************************************************ ZZHintMessageCell ****************************************************/
@interface ZZHintMessageCell ()

@property (nonatomic, strong) UILabel * contentLB;

@end

@implementation ZZHintMessageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"人车无忧特权";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];

    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16);
        make.centerX.mas_equalTo(0);
    }];
    
    UIView *leftLine = [UIView new];
    leftLine.backgroundColor = [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1];
    [self.contentView addSubview:leftLine];
    [self.contentView addSubview:leftLine];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.centerY.mas_equalTo(titleLabel.mas_centerY);
        make.height.mas_equalTo(.5);
        make.right.mas_equalTo(titleLabel.mas_left).offset(-8);
    }];
    
    UIView *rightLine = [UIView new];
    rightLine.backgroundColor = [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1];
    [self.contentView addSubview:rightLine];
    [self.contentView addSubview:rightLine];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel.mas_right).offset(8);
        make.centerY.mas_equalTo(titleLabel.mas_centerY);
        make.height.mas_equalTo(.5);
        make.right.mas_equalTo(-8);
    }];
    
    UILabel *messageLabel = [UILabel new];
    messageLabel.font = [UIFont systemFontOfSize:15];
    messageLabel.numberOfLines = 0;
    messageLabel.textColor = [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1];
    messageLabel.attributedText = [self getMessageAttr];

    [self.contentView addSubview:messageLabel];
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(16);
    }];
}

- (NSAttributedString *)getMessageAttr {
    NSString *str = @"① 生命救援（不限次数）\n② 拖车（100公里内，不限次数）\n③ 电瓶搭电（不限次数）\n④ 更换备胎（不限次数）\n⑤ 派送燃油（不限次数，3升/次）\n⑥ 路边快修（不限次数）\n⑦ 自驾护航（5次，保障10万元）\n⑧ 违章查询（不限次数）\n⑨ 爱车故障咨询&事故协助（不限次数）";
    
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.alignment = NSTextAlignmentLeft;
    p.lineSpacing = 16;
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:str attributes:@{NSParagraphStyleAttributeName : p}];
    
    return attr;
}

@end


@interface CPPackageInfoVC ()

@end

@implementation CPPackageInfoVC

- (void)viewDidLoad {
    
    self.tableViewStyle = UITableViewStyleGrouped;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
    [self loadData];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.title = @"购买服务套餐";
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
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 120;
            break;
        case 1:
            return 370;
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (0 == section) {
        return 16;
    }
    
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (0 == section) {
        return nil;
    }
    
    NSString *footerIdentifier = @"FooterIdnetifer";
    
    UITableViewHeaderFooterView *actionFooter = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdentifier];
    CPActionButton *actionButton = [actionFooter viewWithTag:1000];
    if (nil == actionFooter) {
        actionFooter = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:footerIdentifier];
        
        {
            actionButton = [CPActionButton new] ;
            actionButton.tag = 1000;
            
            [actionFooter.contentView addSubview:actionButton];
            [actionButton addTarget:self action:@selector(push2BuyPage:) forControlEvents:UIControlEventTouchUpInside];
            [actionButton setTitle:@"立即购买" forState:UIControlStateNormal];
            [actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(32);
                make.left.mas_equalTo(32);
                make.right.mas_equalTo(-32);
                make.height.mas_equalTo(40);
            }];
        }
    }

    return actionFooter;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return [self configPriceCell:indexPath];
    } else if (1 == indexPath.section) {
        return [self configMessageCell:indexPath];
    }

    return nil;
}

- (id)configPriceCell:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ZZPriceCellell";
    
    ZZPriceCell *cell = [self.dataTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[ZZPriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (id)configMessageCell:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"ZZMessageCell";
    
    ZZHintMessageCell *cell = [self.dataTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[ZZHintMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


#pragma mark - load data
//- (void)loadData {
//
//}

- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement
- (void)push2BuyPage:(id)sender {
    
    [self.navigationController pushViewController:ZZBuyPackageVC.new
                                         animated:YES];
}

@end
