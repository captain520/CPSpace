//
//  CPGWCertificateVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/22.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPGWCertificateVC.h"
#import "CPCertificateDetailVC.h"

@interface CPGWCertificateVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView * bgImageView;
@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation CPGWCertificateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = [UIColor colorWithRed:232./255 green:253./255 blue:1 alpha:1];
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    {
        self.bgImageView = [UIImageView new];
        self.bgImageView.image = [UIImage imageNamed:@"certificate_title_bg"];
        
        [self.view addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(self->_bgImageView.mas_width).multipliedBy(170./750);;
        }];
    }
    
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = UIColor.clearColor;
        
        [self.view addSubview:self.collectionView];
        
        [self.collectionView registerClass:[CPGWImageTitleButtonCell class] forCellWithReuseIdentifier:@"CPGWImageTitleButtonCell"];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bgImageView.mas_bottom).offset(8);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
    
}
#pragma mark - Delegate && dataSource method implement
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CPGWImageTitleButtonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CPGWImageTitleButtonCell" forIndexPath:indexPath];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width/2;
    
    return CGSizeMake(width, width);
}

#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

@end



@interface CPGWImageTitleButtonCell ()

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton * actionButton;

@end

@implementation CPGWImageTitleButtonCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
//    self.contentView.backgroundColor = UIColor.redColor;
    
    {
        if (nil == self.iconImageView) {
            self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"certificate_img"]];
            
            [self.contentView addSubview:self.iconImageView];
            [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(0);
                make.top.mas_equalTo(0);
                make.width.mas_equalTo(112);
                make.height.mas_equalTo(103);
            }];
        }
    }
    
    {
        if (nil == self.titleLabel) {
            self.titleLabel = [UILabel new];
            self.titleLabel.text = @"CBSLL121312312";
            self.titleLabel.textColor = [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.font = [UIFont systemFontOfSize:14];
            
            [self.contentView addSubview:self.titleLabel];
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->_iconImageView.mas_bottom);
                make.centerX.mas_equalTo(0);
            }];
        }
        
        if (nil == self.actionButton) {
            self.actionButton = [UIButton new];
            self.actionButton.titleLabel.font = [UIFont systemFontOfSize:12];
            [self.actionButton setTitleColor:UIColor.blueColor forState:0];
            [self.actionButton setTitle:@"点击查看" forState:UIControlStateNormal];
            [self.actionButton addTarget:self action:@selector(showCertificateAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.contentView addSubview:self.actionButton];
            [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->_titleLabel.mas_bottom);
                make.centerX.mas_equalTo(0);
                make.height.mas_equalTo(30);
            }];
        }
    }
}

- (void)showCertificateAction:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    
    CPCertificateDetailVC *vc = [[CPCertificateDetailVC alloc] init];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;

    [rootVC presentViewController:vc animated:YES completion:^{
        
    }];

}

@end
