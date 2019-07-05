//
//  CPWalkerView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/2/18.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPWalkerView.h"
#import <Masonry.h>
#import <SDWebImage/UIImage+GIF.h>

@implementation CPWalkerView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    {
        self.image = [UIImage imageNamed:@"growUpBg"];
    }
    
    {
        self.wateringBt = [UIImageView new];
        self.wateringBt.image = [UIImage imageNamed:@"浇水"];
        self.wateringBt.contentMode = UIViewContentModeScaleAspectFit;
        self.wateringBt.userInteractionEnabled = YES;
        self.wateringBt.tag = 1000;

        [self addSubview:self.wateringBt];
        [self.wateringBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.bottom.mas_equalTo(-40);
            make.height.mas_equalTo(80);
        }];
        
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [self.wateringBt addGestureRecognizer:tap];
        }

        
        self.fertilizationBT = [UIImageView new];
        self.fertilizationBT.image = [UIImage imageNamed:@"施肥"];
        self.fertilizationBT.contentMode = UIViewContentModeScaleAspectFit;
        self.fertilizationBT.tag = 1001;
        self.fertilizationBT.userInteractionEnabled = YES;

        [self addSubview:self.fertilizationBT];
        [self.fertilizationBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_wateringBt.mas_right);
            make.bottom.mas_equalTo(self->_wateringBt.mas_bottom);
            make.height.mas_equalTo(self->_wateringBt.mas_height);
            make.width.mas_equalTo(self->_wateringBt.mas_width);
        }];
        
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [self.fertilizationBT addGestureRecognizer:tap];
        }
        
        
        self.disinsectionBT = [UIImageView new];
        self.disinsectionBT.image = [UIImage imageNamed:@"抓虫"];
        self.disinsectionBT.contentMode = UIViewContentModeScaleAspectFit;
        self.disinsectionBT.userInteractionEnabled = YES;
        self.disinsectionBT.tag = 1002;

        [self addSubview:self.disinsectionBT];
        [self.disinsectionBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_fertilizationBT.mas_right);
            make.right.mas_equalTo(-16);
            make.bottom.mas_equalTo(self->_wateringBt.mas_bottom);
            make.height.mas_equalTo(self->_wateringBt.mas_height);
            make.width.mas_equalTo(self->_wateringBt.mas_width);
        }];
        
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
            [self.disinsectionBT addGestureRecognizer:tap];
        }
    }
    
    
    {
        self.totalKiloBT = [CPKiloView new];
        self.totalKiloBT.backgroundColor = UIColor.whiteColor;
//        self.totalKiloBT.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;

        [self addSubview:self.totalKiloBT];
//        [self.totalKiloBT setTitle:@"12312g" forState:UIControlStateNormal];
//        [self.totalKiloBT setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        [self.totalKiloBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.right.mas_equalTo(18);
            make.height.mas_equalTo(36);
            make.width.mas_equalTo(120);
        }];
        
        self.medalBT = [UIButton new];

        [self addSubview:self.medalBT];
        [self.medalBT setBackgroundImage:[UIImage imageNamed:@"勋章"] forState:UIControlStateNormal];
        [self.medalBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.totalKiloBT.mas_bottom).offset(20);
            make.right.mas_equalTo(-16);
            make.size.mas_equalTo(CGSizeMake(44, 44. * 89/72));
        }];
        
        
        self.strategyBT = [UIButton new];
        
        [self addSubview:self.strategyBT];
        [self.strategyBT setBackgroundImage:[UIImage imageNamed:@"攻略"] forState:UIControlStateNormal];
        [self.strategyBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.medalBT.mas_bottom).offset(20);
            make.right.mas_equalTo(-16);
            make.size.mas_equalTo(CGSizeMake(44, 44. * 89/72));
        }];
    }
    
    {
        
        NSMutableArray <UIImage *> *images = @[].mutableCopy;
        
        for (NSInteger i = 1; i <= 12; ++i) {
            NSString *imageName = [NSString stringWithFormat:@"plant_%02ld",(long)i];
            [images addObject:[UIImage imageNamed:imageName]];
        }

        self.treeIV = [UIImageView new];
        self.treeIV.image = [UIImage imageNamed:@"plant_08"];
//        self.treeIV.backgroundColor = UIColor.greenColor;

        [self addSubview:self.treeIV];
        [self sendSubviewToBack:self.treeIV];
        [self.treeIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.wateringBt.mas_top).offset(-40);
            make.centerX.mas_equalTo(0);
        }];
        
        
        self.wateringGifIV = [UIImageView new];
//        NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"浇水动画" ofType:@"gif"];
//        NSData *gifData = [NSData dataWithContentsOfFile:gifPath];
//        self.wateringGifIV.image = [UIImage sd_animatedGIFWithData:gifData];
        self.wateringGifIV.alpha = 0;
        
        [self addSubview:self.wateringGifIV];
        [self.wateringGifIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.treeIV.mas_centerY);
            make.right.mas_equalTo(self.treeIV.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(150, 150));
        }];
        
        
        NSInteger index = arc4random()%15;
        NSInteger row = index/5;
        NSInteger col = index%5;
        CGFloat leftOffset = 30;
        CGFloat rightOffset = 30;
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - leftOffset - rightOffset)/5;
        
        self.ballCount = 4;
        
        NSMutableArray *balls = @[].mutableCopy;
        for (NSInteger i = 0; i < self.ballCount; ++i) {
            while (1) {
                NSNumber *currtnindex = @(arc4random()%15);
                if (NO == [balls containsObject:currtnindex]) {
                    [balls addObject:currtnindex];
                    index = currtnindex.integerValue;
                    row = index/5;
                    col = index%5;
                    break;
                }
            }
            
            UIImageView *popIV = [UIImageView new];
            popIV.backgroundColor = UIColor.redColor;
            popIV.layer.cornerRadius = 25;
            popIV.clipsToBounds = YES;
            
            [self addSubview:popIV];
            [popIV mas_makeConstraints:^(MASConstraintMaker *make) {
                //            make.centerX.mas_equalTo(leftOffset + width/2 + col* width);
                //            make.centerY.mas_equalTo(100 + width/2 + row * width);
                //            make.left.mas_equalTo(100);
                make.top.mas_equalTo(100 + row * width);
                make.left.mas_equalTo(leftOffset + col * width);
                make.width.mas_equalTo(50);
                make.height.mas_equalTo(popIV.mas_width);
            }];
            
            [UIView animateKeyframesWithDuration:1.0f delay:i/3 options:UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                popIV.transform = CGAffineTransformMakeTranslation(0, -20);
            } completion:^(BOOL finished) {
                
            }];
            
        }
//        for (NSInteger i = 0; i < 15; ++i) {
//            NSLog(@"---%u",arc4random()%15);
//        }
//
//        NSInteger index = arc4random()%15;
//        NSInteger row = index/5;
//        NSInteger col = index%5;
//        CGFloat leftOffset = 30;
//        CGFloat rightOffset = 30;
//        CGFloat width = ([UIScreen mainScreen].bounds.size.width - leftOffset - rightOffset)/5;
//
//        self.popIV = [UIImageView new];
//        self.popIV.backgroundColor = UIColor.redColor;
//        self.popIV.layer.cornerRadius = 25;
//        self.popIV.clipsToBounds = YES;
//
//        [self addSubview:self.popIV];
//        [self.popIV mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.centerX.mas_equalTo(leftOffset + width/2 + col* width);
////            make.centerY.mas_equalTo(100 + width/2 + row * width);
////            make.left.mas_equalTo(100);
//            make.top.mas_equalTo(100 + row * width);
//            make.left.mas_equalTo(leftOffset + col * width);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(self.popIV.mas_width);
//        }];
        
//        UIView *testView = [UIView new];
//        testView.backgroundColor = [UIColor colorWithWhite:1 alpha:.5];
//
//        [self addSubview:testView];
//        [testView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(100);
//            make.left.mas_equalTo(leftOffset);
//            make.right.mas_equalTo(-rightOffset);
//            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - leftOffset - rightOffset);
//            make.height.mas_equalTo(3 * width);
//        }];


//        [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:2 initialSpringVelocity:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionBeginFromCurrentState animations:^{
//            self.popIV.transform = CGAffineTransformMakeTranslation(0, -20);
//        } completion:^(BOOL finished) {
//
//        }];
//        [UIView animateKeyframesWithDuration:1.0f delay:0 options:UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//            self.popIV.transform = CGAffineTransformMakeTranslation(0, -20);
//        } completion:^(BOOL finished) {
//
//        }];
        

        

    }
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    
    NSString *gifPath = nil;//[[NSBundle mainBundle] pathForResource:@"浇水动画" ofType:@"gif"];
    NSInteger tag = sender.view.tag;
    switch (tag) {
        case 1000:
            gifPath = [[NSBundle mainBundle] pathForResource:@"浇水动画" ofType:@"gif"];
            break;
        case 1001:
            gifPath = [[NSBundle mainBundle] pathForResource:@"施肥动画" ofType:@"gif"];
            break;
        case 1002:
            gifPath = [[NSBundle mainBundle] pathForResource:@"浇水动画" ofType:@"gif"];
            break;
        default:
            break;
    }
    
    NSData *gifData = [NSData dataWithContentsOfFile:gifPath];
    self.wateringGifIV.image = [UIImage sd_animatedGIFWithData:gifData];
    
    [UIView animateWithDuration:2.0f animations:^{
        self.wateringGifIV.alpha = 1;
    } completion:^(BOOL finished) {
        self.wateringGifIV.alpha = 0;
    }];
}

@end
