//
//  YFTChartView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "YFTChartView.h"
#import "YFTChartGridItem.h"

#define Color(R, G, B, A) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)]

#define randomColor Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1)

@implementation YFTChartView {
    NSMutableArray <YFTChartGridItem *> *items;
    
    CGFloat valueScale;
}

- (id)initWithFrame:(CGRect)frame data:(NSArray *)dataArray {
    if (self = [super initWithFrame:frame]) {
//        self.dataArray = dataArray;
        self.dataArray = @[
                           @1.0, @2.0,@60.0,@4.0,@6.0,@3.0,@8.0
                           ];
        items = @[].mutableCopy;
        
        NSNumber *maxFloat = [self.dataArray valueForKeyPath:@"@max.floatValue"];
        CGFloat maxValue = MAX(100, maxFloat.floatValue);
        valueScale = frame.size.height / maxValue;

        [self setupUI];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
}

- (void)setupUI {
    [self setupUIGrid];
    [self setupPath];
    [self setupDot];
    [self setupToast];
}

- (void)setupToast {
    _toastLB = [YFTChartToastView new];
    _toastLB.layer.cornerRadius = 4;
    _toastLB.alpha = 0;
    _toastLB.clipsToBounds = YES;

    _toastLB.backgroundColor = [UIColor colorWithRed:23./255 green:23./255 blue:23./255 alpha:.4];
    [self addSubview:_toastLB];
    [_toastLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
}
- (void)setupUIGrid {
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width / self.dataArray.count;
    
    [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YFTChartGridItem *gridItem = [YFTChartGridItem new];//[[YFTChartGridItem alloc] initWithFrame:CGRectMake(idx * width, 0, width, 100)];
        [gridItem addTarget:self action:@selector(clickItem:) forControlEvents:64];
        gridItem.tag = idx + 1000;
//        gridItem.backgroundColor = randomColor;
        
        [self addSubview:gridItem];
        [gridItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(width);
            make.left.mas_equalTo(idx * width);
        }];
        
        [self->items addObject:gridItem];
    }];
}

- (void)setupPath {
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width / self.dataArray.count;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineJoinStyle = kCGLineJoinRound;
    [self.dataArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx == 0) {
            [path moveToPoint:CGPointMake(width/2, self.bounds.size.height - obj.floatValue * self->valueScale)];
        } else {
            CGPoint valuePoint = CGPointMake(width / 2 + idx * width,self.bounds.size.height - obj.floatValue * self->valueScale);
            [path addLineToPoint:valuePoint];
        }
    }];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = 2;
    shapeLayer.strokeColor = UIColor.whiteColor.CGColor;
    shapeLayer.fillColor = UIColor.clearColor.CGColor;
    shapeLayer.lineJoin = kCALineJoinRound;

    [self.layer addSublayer:shapeLayer];
}

- (void)setupDot {
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width / self.dataArray.count;
    
    [self.dataArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGPoint valuePoint = CGPointMake(width / 2 + idx * width, self.bounds.size.height - obj.floatValue * self->valueScale);
        
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:valuePoint radius:4 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        
        CAShapeLayer *circleShape = [CAShapeLayer layer];
        circleShape.path = circlePath.CGPath;
        circleShape.strokeColor = UIColor.whiteColor.CGColor;
        circleShape.lineWidth = 1.0f;
        circleShape.fillColor = UIColor.redColor.CGColor;

        [self.layer addSublayer:circleShape];
    }];
}

- (void)clickItem:(YFTChartGridItem *)item {


    NSLog(@"%s:%@", __FUNCTION__,@(item.tag - 1000));
    [items enumerateObjectsUsingBlock:^(YFTChartGridItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (obj.tag == item.tag) {
                obj.line.backgroundColor = UIColor.orangeColor;
            } else {
                obj.line.backgroundColor = UIColor.grayColor;
            }
        });
    }];
    
    CGFloat offsetY = self.bounds.size.height - self.dataArray[item.tag - 1000].floatValue * self->valueScale;
    offsetY = self.dataArray[item.tag - 1000].floatValue * self->valueScale + 10;
    
    CGFloat offsetX = item.frame.origin.x + item.frame.size.width * 2 / 3;
    if ((item.tag - 1000 + 1) == self.dataArray.count) {
        offsetX -= 88; //item.frame.origin.x - 66;
    }

    self.toastLB.alpha = 1;
    self.toastLB.toastLB.attributedText = [self getToastAttr:@"¥ 0.00\n" type:@"营收\n" date:@"2019/4/26"];
    [self.toastLB mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(offsetX);//(item.frame.origin.x + item.frame.size.width * 2 / 3);
//        make.top.mas_equalTo(self.frame.size.height * 1 / 3);
        make.bottom.mas_equalTo(-offsetY);
        make.width.mas_equalTo(66);
        make.height.mas_equalTo(60);
    }];
    
    [UIView animateWithDuration:1.0f delay:3 options:UIViewAnimationOptionCurveLinear animations:^{
        self->_toastLB.alpha = 0;
    } completion:^(BOOL finished) {
    }];
}

- (NSAttributedString *)getToastAttr:(NSString *)price type:(NSString *)typeName date:(NSString *)date {
    
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
//    p.lineSpacing = 10;
    p.headIndent = 30;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    
    NSMutableAttributedString *string0 = [[NSMutableAttributedString alloc] initWithString:typeName attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 11],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:.6]}];
    
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:date attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 10],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]}];
    
    [attr appendAttributedString:string0];
    [attr appendAttributedString:string1];
    [attr addAttribute:NSParagraphStyleAttributeName value:p range:NSMakeRange(0, attr.length)];

    return attr;
}

@end
