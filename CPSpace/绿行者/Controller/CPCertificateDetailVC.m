//
//  CPCertificateDetailVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/22.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPCertificateDetailVC.h"

@interface CPCertificateDetailVC ()

@property (nonatomic, strong) UIImageView * bgImageView;

@property (nonatomic, strong) UILabel * contentLB;

@property (nonatomic, strong) UIButton * companyNameButton;

@property (nonatomic, strong) UILabel * codeLabel;


@end

@implementation CPCertificateDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    NSAttributedString *attr = [self contentAttr:@"精钢狼" from:@"2010年10月12日" to:@"2018年09月21日" minikilo:@"90" percent:@"90%"];
    CGFloat imageHeight = [self getAttrHeight:attr] + 100 + 16 + 80;

    if (nil == self.bgImageView) {
        
        UIImage *image = [UIImage imageNamed:@"digtalCertificate_bg"];
        image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:image.size.height/2];
        self.bgImageView = [[UIImageView alloc] initWithImage:image];
        
        [self.view addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.height.mas_equalTo(imageHeight);
        }];
    }
    
    if (nil == self.contentLB) {
        self.contentLB = [UILabel new];
        self.contentLB.numberOfLines = 0;
        self.contentLB.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
        self.contentLB.attributedText = attr;///[self contentAttr:@"精钢狼精钢狼精钢狼精钢狼精钢狼精钢狼精钢精钢狼精钢狼狼" from:@"2010-10-12" to:@"2018-09-21" minikilo:@"90" percent:@"90%"];
        
        [self.view addSubview:self.contentLB];
        [self.contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_bgImageView.mas_top).offset(100);
            make.left.mas_equalTo(32);
            make.right.mas_equalTo(-32);
        }];
    }
    
    if (nil == self.companyNameButton) {
        self.companyNameButton = [UIButton new];
        self.companyNameButton.titleLabel.font = [UIFont systemFontOfSize:15];
        self.companyNameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

        [self.companyNameButton setTitleColor:[UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1] forState:UIControlStateNormal];
        [self.companyNameButton setImage:[UIImage imageNamed:@"Seal_icon"] forState:UIControlStateNormal];
        [self.companyNameButton setTitle:@"  北京环境交易所" forState:UIControlStateNormal];
        
        [self.view addSubview:self.companyNameButton];
        [self.companyNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_contentLB.mas_bottom).offset(16);
            make.right.mas_equalTo(-32);
        }];
    }

    
    if (nil == self.codeLabel) {
        self.codeLabel = [UILabel new];
        self.codeLabel.text = @"CBEEX2018041100";
        self.codeLabel.font = [UIFont systemFontOfSize:14];
        self.codeLabel.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
        
        [self.view addSubview:self.codeLabel];
        [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->_companyNameButton.mas_bottom);
            make.right.mas_equalTo(-32);
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

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (NSAttributedString *)contentAttr:(NSString *)name
                               from:(NSString *)fromDate
                                 to:(NSString *)todate
                           minikilo:(NSString *)quntity
                            percent:(NSString *)percent {
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"兹此证明，" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]}];
    NSAttributedString *nameAttr = [[NSAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:16]}];
    
    NSString *otherStr = [NSString stringWithFormat:@"自%@参加减排活动以来，截止%@，共计贡献减排%@克，打败了全国%@的人。\n特发此证，以资鼓励！",fromDate,todate,quntity,percent];
    
    NSAttributedString *attr1 = [[NSAttributedString alloc] initWithString:otherStr attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]}];;

    [attr appendAttributedString:nameAttr];
    [attr appendAttributedString:attr1];
    
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.lineSpacing = 10;
    p.firstLineHeadIndent = 30;
    
    [attr addAttribute:NSParagraphStyleAttributeName value:p range:NSMakeRange(0, attr.length)];

    return attr;
}

- (CGFloat)getAttrHeight:(NSAttributedString *)attr {
    
    CGRect ret = [attr boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 64, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return ret.size.height;
}

@end
