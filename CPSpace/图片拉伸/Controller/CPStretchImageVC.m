//
//  CPStretchImageVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPStretchImageVC.h"

@interface CPStretchImageVC ()

@property (nonatomic, strong) UIImageView * imageView;

@end

@implementation CPStretchImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    if (nil == self.imageView) {
        self.imageView = [UIImageView new];
        self.imageView.image = [UIImage imageNamed:@"pic_bg"];
        
        [self.view addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
//            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(self->_imageView.mas_width).multipliedBy(self->_imageView.image.size.height/self->_imageView.image.size.width);
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

@end
