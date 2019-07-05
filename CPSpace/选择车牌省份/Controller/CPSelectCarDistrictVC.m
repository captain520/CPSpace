//
//  CPSelectCarDistrictVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/13.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPSelectCarDistrictVC.h"
#import "CPResponderButton.h"
#import "CPCarDistrictCollectionView.h"
#import "CPCollectionViewLayout.h"
#import "CPDoneView.h"

@interface CPSelectCarDistrictVC ()

@property (nonatomic, strong) CPResponderButton *actionButton;
@property (nonatomic, strong) CPCarDistrictCollectionView * collectionView;
@property (nonatomic, strong) CPDoneView * doneView;

@end

@implementation CPSelectCarDistrictVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
#pragma mark - setter && getter method
- (CPCarDistrictCollectionView *)collectionView {
    if (nil == _collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[CPCarDistrictCollectionView alloc] initWithFrame:CGRectMake(0, 0, UIApplication.sharedApplication.keyWindow.bounds.size.width, UIScreen.mainScreen.bounds.size.width/8 * 4) collectionViewLayout:layout];
        _collectionView.selectedDistrict = @"粤";
    }
    
    return _collectionView;
}

- (CPDoneView *)doneView {
    if (nil == _doneView) {
        
         __weak typeof(self) weakSelf = self;
        
        _doneView = [[CPDoneView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 44)];
        _doneView.doneActionBlock = ^{
            [weakSelf handleDoneActionBlock];
        };
    }
    
    return _doneView;
}

- (void)handleDoneActionBlock {
    [self.view endEditing:YES];
    
    NSLog(@"-----:%@",self.collectionView.selectedDistrict);
}

#pragma mark - Setup UI
- (void)setupUI {
    if (nil == self.actionButton) {
        self.actionButton = [CPResponderButton new];
        self.actionButton.backgroundColor = UIColor.redColor;
        self.actionButton.inputView = self.collectionView;
        self.actionButton.inputAccessoryView = self.doneView;
        [self.actionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.actionButton];
        [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(100);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(50);
        }];
    }
}
#pragma mark - Delegate && dataSource method implement
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (void)buttonAction:(CPResponderButton *)sender {
    NSLog(@"------------------------------");
    [sender becomeFirstResponder];
}

@end
