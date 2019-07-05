//
//  CPCPAnimation2VC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/4/20.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPCPAnimation2VC.h"

@interface CPCPAnimation2VC ()<CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer * shapeLayer;

@property (nonatomic, strong) UIImageView * popView;

@end

@implementation CPCPAnimation2VC

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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self.view layoutIfNeeded];
    [self.view setNeedsDisplay];
}
#pragma mark - Setup UI
- (void)setupUI {
    
//    [self initRectLayer];
    
    if (nil == self.popView) {
        self.popView = [UIImageView new];
        self.popView.backgroundColor = UIColor.redColor;

        [self.view addSubview:self.popView];
        [self.popView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(200);
            make.left.mas_equalTo(100);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
        }];
    }

//    self.popView.layer.transform
    
//    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    frameAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 30, 0)],[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)]];
////    frameAnimation.values = @[[nsva],@(-20)];
//    frameAnimation.duration = 1;
//    frameAnimation.repeatCount = CGFLOAT_MAX;
//    frameAnimation.fillMode = kCAFillModeForwards;
//    frameAnimation.removedOnCompletion = NO;
//    frameAnimation.autoreverses = YES;
//
//    [self.popView.layer addAnimation:frameAnimation forKey:@"frameAnimation"];
    
    [self performSelector:@selector(addKeyAnimate:) withObject:self.popView afterDelay:1];
    
//    [UIView animateKeyframesWithDuration:1.0f delay:arc4random()%2 options:UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionCalculationModeLinear | UIViewAnimationOptionAllowUserInteraction | UIViewKeyframeAnimationOptionOverrideInheritedDuration | UIViewAnimationOptionAllowAnimatedContent animations:^{
//        self.popView.transform = CGAffineTransformMakeTranslation(0, -10);
//    } completion:^(BOOL finished) {
//
//    }];

//    if (nil == self.shapeLayer) {
//
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(0, 0)];
//        [path addLineToPoint:CGPointMake(50, 0)];
//
//
//        self.shapeLayer = [CAShapeLayer layer];
//        self.shapeLayer.frame = CGRectMake(100, 100, 400, 200);
//        self.shapeLayer.strokeColor = UIColor.redColor.CGColor;
//        self.shapeLayer.lineWidth = 1;
//        self.shapeLayer.fillColor = UIColor.clearColor.CGColor;
//        self.shapeLayer.path = path.CGPath;
//
//        [self.view.layer addSublayer:self.shapeLayer];
//    }
    
}

- (void)addKeyAnimate:(id)object {
    NSLog(@"");
    
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    frameAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 30, 0)],[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0, 0)]];
    //    frameAnimation.values = @[[nsva],@(-20)];
    frameAnimation.duration = 1;
    frameAnimation.repeatCount = CGFLOAT_MAX;
    frameAnimation.fillMode = kCAFillModeForwards;
    frameAnimation.removedOnCompletion = NO;
    frameAnimation.autoreverses = YES;
    
    [self.popView.layer addAnimation:frameAnimation forKey:@"frameAnimation"];
}

//绕矩形循环跑
- (void)initRectLayer
{
    CALayer * rectLayer = [[CALayer alloc] init];
    rectLayer.frame = CGRectMake(15, 200, 30, 30);
    rectLayer.cornerRadius = 15;
    rectLayer.backgroundColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:rectLayer];
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设定关键帧位置，必须含起始与终止位置
    rectRunAnimation.values = @[[NSValue valueWithCGPoint:rectLayer.frame.origin],
                                [NSValue valueWithCGPoint:CGPointMake(320 - 15,
                                                                      rectLayer.frame.origin.y)],
                                [NSValue valueWithCGPoint:CGPointMake(320 - 15,
                                                                      rectLayer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:CGPointMake(15, rectLayer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:rectLayer.frame.origin]];
    //设定每个关键帧的时长，如果没有显式地设置，则默认每个帧的时间=总duration/(values.count - 1)
    rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.6],
                                  [NSNumber numberWithFloat:0.7], [NSNumber numberWithFloat:0.8],
                                  [NSNumber numberWithFloat:1]];
    rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    rectRunAnimation.repeatCount = 1000;
    rectRunAnimation.autoreverses = NO;
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration = 4;
    rectRunAnimation.removedOnCompletion = NO;
    [rectLayer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (IBAction)buttonAction:(id)sender {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = UIColor.whiteColor;
    
    [self.navigationController pushViewController:vc animated:YES];

    return;
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(50, 0)];
    [path1 addLineToPoint:CGPointMake(100, 0)];
    
    

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.toValue = (id)path1.CGPath;
    animation.duration = 1.0f;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.delegate = self;


    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 10) radius:10 startAngle:-M_PI_2 endAngle:3./2 * M_PI clockwise:YES];
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.toValue = (id)path2.CGPath;
    animation2.duration = 1.0f;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    animation2.delegate = self;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation, animation2];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.duration = 1;
    
    
    CAKeyframeAnimation *keyA = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    keyA.values = @[(id)path1.CGPath,(id)path2.CGPath];
    keyA.removedOnCompletion = NO;
    keyA.fillMode = kCAFillModeForwards;
    keyA.duration = 1;

    [self.shapeLayer addAnimation:keyA forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    [self.shapeLayer removeAllAnimations];
}

@end
