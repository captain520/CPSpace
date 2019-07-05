//
//  CPAnimationVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/20.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPAnimationVC.h"

@interface CPAnimationVC ()

@property (nonatomic, strong) CAShapeLayer * shapeLayer;

@end

@implementation CPAnimationVC

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
    
    if (nil == self.shapeLayer) {
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(100, 0)];

        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.frame = CGRectMake(100, 100, 200, 200);
        self.shapeLayer.strokeColor = UIColor.redColor.CGColor;
        self.shapeLayer.lineWidth = 1;
        self.shapeLayer.fillColor = UIColor.clearColor.CGColor;
        self.shapeLayer.path = path.CGPath;
        
        [self.view.layer addSublayer:self.shapeLayer];
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
