//
//  CPPaoPaoView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/14.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPPaoPaoView.h"

@implementation CPPaoPaoView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    CAShapeLayer *shapeLayer = [self drawPopViewWithBounds:self.bounds radius:5];
    
    [self.layer addSublayer:shapeLayer];
    
    self.titleLB = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, CGRectGetWidth(self.bounds) - 4 * 5, CGRectGetHeight(self.bounds) - 3 * 5)];
    self.titleLB.font = [UIFont systemFontOfSize:13];
    self.titleLB.numberOfLines = 0;
    [self addSubview:self.titleLB];
}


/**
 获取泡泡形状

 @param rect 泡泡的bounds
 @param radius 圆角大小
 @return 回去泡泡形状
 */
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
    layer.shadowColor = UIColor.grayColor.CGColor;
    layer.shadowOffset = CGSizeMake(10, 10);
    layer.shadowRadius = 10;
    layer.shadowOpacity = .5;
    
    return layer;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    [self updatePopViewTitle];
}

- (void)setSubTitle:(NSString *)subTitle {
    _subTitle = subTitle;
    
    [self updatePopViewTitle];
}

- (void)setAttrText:(NSAttributedString *)attrText {
    _attrText = attrText;
    
    [self updatePopViewTitle];
}

- (void)setAlignment:(NSTextAlignment)alignment {
    _alignment = alignment;
    
    [self updatePopViewTitle];
}

/**
  刷新标题
 */
- (void)updatePopViewTitle {
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attrText];
    NSMutableParagraphStyle *p = [[NSMutableParagraphStyle alloc] init];
    p.alignment = self.alignment;
    
    [attr addAttribute:NSParagraphStyleAttributeName value:p range:NSMakeRange(0, attr.length)];
    
    self.titleLB.attributedText = attr;

//    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
//    if (self.title) {
//        NSString *attrTitleStr = [NSString stringWithFormat:@"%@\n",self.title];
//        NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:attrTitleStr attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]}];
//        [attr appendAttributedString:titleAttr];
//    }
//
//    if (self.subTitle) {
//        NSAttributedString *titleAttr = [[NSAttributedString alloc] initWithString:self.subTitle attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
//        [attr appendAttributedString:titleAttr];
//    }
//
//    self.titleLB.attributedText = attr;
}

@end
