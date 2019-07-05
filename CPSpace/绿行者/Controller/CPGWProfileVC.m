//
//  CPGWProfileVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/25.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPGWProfileVC.h"

@interface CPGWProfileVC ()

@property (nonatomic, strong) NSArray <NSString *> *imageNames;
@property (nonatomic, strong) NSArray <NSString *> *titleNames;
@property (nonatomic, strong) NSArray <NSString *> *subTitleNames;

@end

@implementation CPGWProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self loadData];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
//    self.tableViewStyle = UITableViewStyleGrouped;
    
    self.imageNames = @[
                        @"ECO_my_detail_icon",
                        @"ECO_my_stopDrive_icon",
                        @"ECO_my_walk_icon",
                        @"ECO_my_crossTime_icon",
                        @"ECO_my_quickRoad_icon",
                        @"ECO_my_pay_icon",
                        @"ECO_my_digInvoice_ico",
                        ];
    
    self.titleNames = @[
                        @"减排明细",
                        @"停驶",
                        @"步行",
                        @"错峰出行",
                        @"ETC高速通行",
                        @"ETC缴费",
                        @"电子发票",
                        ];
    
    self.subTitleNames = @[
                           @"",
                           @"0 g",
                           @"0 g",
                           @"0 g",
                           @"0 g",
                           @"0 g",
                           @"0 g",
                           ];
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {

}
#pragma mark - Delegate && dataSource method implement

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageNames.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return UIScreen.mainScreen.bounds.size.width * 558 / 750 + 8;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSString *headerIdentifier = @"Header";
    
    CPGWProfileHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (nil == header) {
        header = [[CPGWProfileHeader alloc] initWithReuseIdentifier:headerIdentifier];
    }
    
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"CPWWProfileCell";
    
    CPWWProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[CPWWProfileCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = indexPath.row ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = indexPath.row ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleGray;

    cell.imageIV.image = [UIImage imageNamed:self.imageNames[indexPath.row]];
    cell.titleLB.text = self.titleNames[indexPath.row];
    cell.subTitleLB.text = self.subTitleNames[indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - load data
//- (void)loadData {
//
//}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

@end



@interface CPGWProfileHeader ()

@property (nonatomic, strong) UIImageView * headerImageView;
@property (nonatomic, strong) UIImageView * avaterImageView;
@property (nonatomic, strong) UILabel *hintLB;
@property (nonatomic, strong) UILabel * gCountLB;
@property (nonatomic, strong) UILabel * untiLB;
@property (nonatomic, strong) UILabel * nameLB;
@property (nonatomic, strong) UILabel * rideLB;
@property (nonatomic, strong) UILabel * walkLB;
@property (nonatomic, strong) UILabel * eletericLB;


@end

@implementation CPGWProfileHeader

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    if (nil == self.headerImageView) {
        
        self.headerImageView = [UIImageView new];
        self.headerImageView.image = [UIImage imageNamed:@"ECO_my_bg"];
        self.headerImageView.userInteractionEnabled = YES;
        
        [self.contentView addSubview:self.headerImageView];
        [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(self.headerImageView.mas_width).multipliedBy(558./750);;
        }];
    }
    
    if (nil == self.avaterImageView) {
        
        self.avaterImageView = [UIImageView new];
        self.avaterImageView.image = [UIImage imageNamed:@"ECO_my_bg"];
        self.avaterImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.avaterImageView.userInteractionEnabled = YES;
        self.avaterImageView.layer.cornerRadius = 33;
        self.avaterImageView.clipsToBounds = YES;
        self.avaterImageView.layer.borderColor = UIColor.whiteColor.CGColor;
        self.avaterImageView.layer.borderWidth = 1.0f;
        self.avaterImageView.backgroundColor = UIColor.groupTableViewBackgroundColor;
        
        [self.contentView addSubview:self.avaterImageView];
        [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(66);
            make.centerX.mas_equalTo(0);
            make.height.mas_equalTo(self.avaterImageView.mas_width);
        }];
    }
    
    if (nil == self.gCountLB) {
        self.gCountLB = [UILabel new];
        self.gCountLB.text = @"820527";
        self.gCountLB.textColor = UIColor.whiteColor;
        self.gCountLB.font = [UIFont systemFontOfSize:50];

        [self.contentView addSubview:self.gCountLB];
        [self.gCountLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_avaterImageView.mas_bottom).offset(28);
            make.centerX.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
    }
    
    if (nil == self.untiLB) {
        self.untiLB = [UILabel new];
        self.untiLB.text = @"g";
        self.untiLB.textColor = UIColor.whiteColor;
        self.untiLB.font = [UIFont systemFontOfSize:11];
        
        [self.contentView addSubview:self.untiLB];
        [self.untiLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_gCountLB.mas_top);
            make.left.mas_equalTo(self->_gCountLB.mas_right);
        }];
    }

    if (nil == self.hintLB) {
        self.hintLB = [UILabel new];
        self.hintLB.text = @"个人累积减排量";
        self.hintLB.textColor = UIColor.whiteColor;
        self.hintLB.font = [UIFont systemFontOfSize:12];

        [self.contentView addSubview:self.hintLB];
        [self.hintLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self->_gCountLB.mas_top).offset(0);
            make.left.mas_equalTo(self->_gCountLB.mas_left);
        }];
    }
    
    if (nil == self.nameLB) {
        self.nameLB = [UILabel new];
        self.nameLB.text = @"车载男";
        self.nameLB.textColor = UIColor.whiteColor;
        self.nameLB.font = [UIFont systemFontOfSize:15];
        self.nameLB.backgroundColor = [UIColor colorWithRed:5./255 green:16. * 9 /255 blue:(7 * 16 + 3)/255. alpha:1];
        self.nameLB.layer.cornerRadius = 13;
        self.nameLB.clipsToBounds = YES;
        self.nameLB.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:self.nameLB];
        [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_gCountLB.mas_bottom).offset(16);
            make.centerX.mas_equalTo(0);
            make.height.mas_equalTo(26);
            make.width.mas_equalTo(177);
        }];
    }
    
    if (nil == self.rideLB) {
        self.rideLB = [UILabel new];
        self.rideLB.text = @"125";
        self.rideLB.textColor = [UIColor colorWithRed:5./255 green:16. * 9 /255 blue:(7 * 16 + 3)/255. alpha:1];
        self.rideLB.font = [UIFont systemFontOfSize:12];
        self.rideLB.textAlignment = NSTextAlignmentCenter;
        self.rideLB.attributedText = [self getAttrText:@"254" message:@"骑车 (小时)"];
        self.rideLB.numberOfLines = 0;

        [self.contentView addSubview:self.rideLB];
        [self.rideLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.bottom.mas_equalTo(-16);
        }];
        
        {
            UIView *sepLine = [UIView new];
            sepLine.backgroundColor = UIColor.whiteColor;
            
            [self.contentView addSubview:sepLine];
            [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self->_rideLB.mas_right);
                make.top.mas_equalTo(self->_rideLB.mas_top);
                make.bottom.mas_equalTo(self->_rideLB.mas_bottom);
                make.width.mas_equalTo(1);
            }];
        }
    }
    
    if (nil == self.walkLB) {
        self.walkLB = [UILabel new];
        self.walkLB.text = @"125";
        self.walkLB.textColor = [UIColor colorWithRed:5./255 green:16. * 9 /255 blue:(7 * 16 + 3)/255. alpha:1];
        self.walkLB.font = [UIFont systemFontOfSize:12];
        self.walkLB.textAlignment = NSTextAlignmentCenter;
        self.walkLB.attributedText = [self getAttrText:@"1000" message:@"行走 (公里)"];
        self.walkLB.numberOfLines = 0;

        [self.contentView addSubview:self.walkLB];
        [self.walkLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_rideLB.mas_right);
            make.width.mas_equalTo(self->_rideLB.mas_width);
            make.bottom.mas_equalTo(-16);
        }];
        
        {
            UIView *sepLine = [UIView new];
            sepLine.backgroundColor = UIColor.whiteColor;
            
            [self.contentView addSubview:sepLine];
            [sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self->_walkLB.mas_right);
                make.top.mas_equalTo(self->_rideLB.mas_top);
                make.bottom.mas_equalTo(self->_rideLB.mas_bottom);
                make.width.mas_equalTo(1);
            }];
        }
    }
    
    if (nil == self.eletericLB) {
        self.eletericLB = [UILabel new];
        self.eletericLB.text = @"125";
        self.eletericLB.textColor = [UIColor colorWithRed:5./255 green:16. * 9 /255 blue:(7 * 16 + 3)/255. alpha:1];
        self.eletericLB.font = [UIFont systemFontOfSize:12];
        self.eletericLB.textAlignment = NSTextAlignmentCenter;
        self.eletericLB.attributedText = [self getAttrText:@"45" message:@"省电 (度)"];
        self.eletericLB.numberOfLines = 0;
        
        [self.contentView addSubview:self.eletericLB];
        [self.eletericLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_walkLB.mas_right);
            make.width.mas_equalTo(self->_rideLB.mas_width);
            make.right.mas_equalTo(-16);
            make.bottom.mas_equalTo(-16);
        }];
    }
}

- (NSAttributedString *)getAttrText:(NSString *)num message:(NSString *)msg {
    
    NSString *message = [NSString stringWithFormat:@"\n%@",msg];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:num attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:30]}];
    NSAttributedString *attr1 = [[NSAttributedString alloc] initWithString:message attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}];
    
    [attr appendAttributedString:attr1];

    return attr;
}

@end


@interface CPWWProfileCell ()


@end

@implementation CPWWProfileCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    if (nil == self.imageIV) {
        self.imageIV = [UIImageView new];
        self.imageIV.contentMode = UIViewContentModeScaleAspectFit;
        self.imageIV.image = [UIImage imageNamed:@"ECO_my_crossTime_icon"];
        self.imageIV.clipsToBounds =  YES;

        [self.contentView addSubview:self.imageIV];
        [self.imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.top.mas_equalTo(16);
            make.bottom.mas_equalTo(-16);
            make.width.mas_equalTo(self->_imageIV.mas_height);
        }];
    }
    
    if (nil == self.titleLB) {
        self.titleLB = [UILabel new];
        self.titleLB.font = [UIFont systemFontOfSize:15];
        self.titleLB.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
        self.titleLB.text = @"减排明细";

        [self.contentView addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_imageIV.mas_right).offset(8);
            make.centerY.mas_equalTo(0);
        }];
    }
    
    if (nil == self.subTitleLB) {
        self.subTitleLB = [UILabel new];
        self.subTitleLB.font = [UIFont systemFontOfSize:11];
        self.subTitleLB.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
        self.subTitleLB.text = @"0 g";
        
        [self.contentView addSubview:self.subTitleLB];
        [self.subTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-16);
            make.centerY.mas_equalTo(0);
        }];
    }
}

@end
