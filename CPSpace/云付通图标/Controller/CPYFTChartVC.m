//
//  CPYFTChartVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPYFTChartVC.h"
#import "YFTChartView.h"

@interface CPYFTChartVC ()

@property (nonatomic, strong) YFTChartView *chartView;

@end

@implementation CPYFTChartVC

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
#pragma mark - Setup UI
- (void)setupUI {
    
    CGRect chartFrame = CGRectMake(0, 0, self.view.bounds.size.width, 255);

    self.chartView = [[YFTChartView alloc] initWithFrame:chartFrame data:@[]];;
    self.chartView.backgroundColor = UIColor.redColor;

    [self.view addSubview:self.chartView];
}

#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement


@end
