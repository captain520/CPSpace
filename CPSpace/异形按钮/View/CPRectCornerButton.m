//
//  CPRectCornerButton.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/11.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPRectCornerButton.h"

@implementation CPRectCornerButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    CGFloat radius = 10;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    
    [path addLineToPoint:CGPointMake(self.bounds.size.width - radius, 0)];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width - radius, radius) radius:radius startAngle:M_PI * 3 / 2 endAngle:M_PI / 6  clockwise:YES];
//    [path addLineToPoint:CGPointMake(self.bounds.size.width - self.bounds.size.height * tan(M_PI/6), self.bounds.size.height - radius/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width - (self.bounds.size.height  - 2 * radius) / tan(M_PI / 3), self.bounds.size.height - radius/2)];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width - self.bounds.size.height * tan(M_PI/6) - radius / sin(M_PI / 3), self.bounds.size.height - radius) radius:radius startAngle:M_PI/6 endAngle:M_PI_2  clockwise:YES];
//    [path addLineToPoint:CGPointMake(radius, self.bounds.size.height)];
//    [path addArcWithCenter:CGPointMake(radius, self.bounds.size.height - radius) radius:radius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
//    [path closePath];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.bounds = self.bounds;
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = UIColor.clearColor.CGColor;
    shapeLayer.frame = self.bounds;
    shapeLayer.lineWidth = 1;
    shapeLayer.strokeColor = UIColor.redColor.CGColor;
    
//    self.layer.mask = shapeLayer;
    [self.layer addSublayer:shapeLayer];
}

@end
