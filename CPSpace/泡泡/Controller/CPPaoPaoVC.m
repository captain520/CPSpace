//
//  CPPaoPaoVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/14.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPPaoPaoVC.h"
#import "CPPaoPaoView.h"

@interface CPPaoPaoVC ()

@end

@implementation CPPaoPaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
//    CAShapeLayer *shapeLayer = [self drawPopViewWithBounds:CGRectMake(0, 0, 300, 100) radius:10];
//    shapeLayer.frame = CGRectMake(30, 100, 300, 200);
//
//    [self.view.layer insertSublayer:shapeLayer atIndex:0];
    NSString *title = @"点击选用该地址";
    NSString *subTitle = @"sadlfjalsdfjlalsadlfjalssadlfjalsdfjlalsadlsadlfjalsdfjlalsadlsadlfjalsdfjlalsadldfjlalsadlfjalsdfjlalsadlfjalsdfjlal\nsdfkalsdkf lsd]\nfjasklf";
//    subTitle = @"sldfj";
    
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.alignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]}];
    NSAttributedString *enterSpace = [[NSAttributedString alloc] initWithString:@"\n" attributes:nil];
    NSAttributedString *subtitleAttr = [[NSAttributedString alloc] initWithString:subTitle attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];;
    
    [attr appendAttributedString:enterSpace];
    [attr appendAttributedString:subtitleAttr];
    
    [attr addAttribute:NSParagraphStyleAttributeName value:p range:NSMakeRange(0, attr.length)];


    CGSize size = [attr boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;

    CPPaoPaoView *paopaoView = [[CPPaoPaoView alloc] initWithFrame:CGRectMake(30, 300, size.width + 20, size.height + 15)];
//    paopaoView.title = title;
//    paopaoView.subTitle = subTitle;
    paopaoView.attrText = attr;

    [self.view addSubview:paopaoView];
}

- (CAShapeLayer *)drawPopViewWithBounds:(CGRect)rect radius:(CGFloat)radius{
    
    //  左上角圆角
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI endAngle:M_PI + M_PI_2 clockwise:YES];
    
    //  上部横线
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - radius, 0)];
    //  右上角圆角
    [path addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - radius, radius) radius:radius startAngle:( M_PI + M_PI_2) endAngle:(2 * M_PI) clockwise:YES];
    //  右边直线
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect) - radius - radius)];
    //  右下角圆角
    [path addArcWithCenter:CGPointMake(CGRectGetMaxX(rect) - radius, CGRectGetMaxY(rect) - radius - radius) radius:radius startAngle:(0) endAngle:(M_PI_2) clockwise:YES];
    //  底部右边直线
    [path addLineToPoint:CGPointMake(CGRectGetWidth(rect)/2. + radius, CGRectGetMaxY(rect) - radius)];
    //  底部三角形
    [path addLineToPoint:CGPointMake(CGRectGetWidth(rect)/2., CGRectGetMaxY(rect))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(rect)/2 - radius, CGRectGetMaxY(rect) - radius)];
    //  底部左边直线
    [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) + radius, CGRectGetMaxY(rect) - radius)];
    //  左下角圆角
    [path addArcWithCenter:CGPointMake(CGRectGetMinX(rect) + radius, CGRectGetMaxY(rect) - radius - radius) radius:radius startAngle:(M_PI_2) endAngle:(M_PI) clockwise:YES];
    
    [path closePath];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = UIColor.whiteColor.CGColor;
    layer.lineWidth = .5;
    layer.strokeColor = UIColor.grayColor.CGColor;
    layer.shadowColor = UIColor.redColor.CGColor;
    layer.shadowOffset = CGSizeMake(10, 10);
    layer.shadowRadius = 10;
    layer.shadowOpacity = .5;

    return layer;
}

#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement


@end
