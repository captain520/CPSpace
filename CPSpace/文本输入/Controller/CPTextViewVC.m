//
//  CPTextViewVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/14.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTextViewVC.h"
#import "YFTTextView.h"

@interface CPTextViewVC ()

@property (nonatomic, strong) YFTTextView * textView;

@end

@implementation CPTextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    self.textView = [YFTTextView new];
    self.textView.backgroundColor = UIColor.redColor;
    
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.height.mas_equalTo(100);
    }];

}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement


@end
