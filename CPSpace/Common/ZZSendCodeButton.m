//
//  ZZSendCodeButton.m
//  chelian
//
//  Created by wangzhangchuan on 2017/11/2.
//  Copyright © 2017年 zhizai. All rights reserved.
//

#import "ZZSendCodeButton.h"

#define MAXSECOND           (30)

@interface ZZSendCodeButton()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSUInteger count;

@end

@implementation ZZSendCodeButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self initializedBaseProperties];
        
        [self addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)initializedBaseProperties {
    
    self.count = MAXSECOND;
    
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [self setTitle:@"发送验证码" forState:UIControlStateNormal];
}

- (void)sendCode:(UIButton *)sender {

    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    NSString *phoneNumber = [ZZBaseObject shareInstance].userInfoModel.phone;
//    NSDictionary * parameter = [NSDictionary dictionaryWithObjectsAndKeys:phoneNumber,@"phone", nil];
//
//    [[ZZBaseRequest shareInstance] RequestWithGet:[NSString stringWithFormat:@"%@%@",netIp,URL_User_sendCaptcha]
//                                        parameter:parameter
//                                     successBlock:^(NSDictionary * dic)
//     {
//         NSString *message = dic[@"msg"];
//         NSInteger status = [dic[@"status"] integerValue];
         
//         [[ZZProgress Instance] showToast:keyWindow message:@"发送验证码成功"];
//         if (status == 1) {
         if (_timer == nil) {;
             _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
         }
         //         }
         
//     } failureBlock:^(ZZError * error) {
//
//         [[ZZProgress Instance] showToast:keyWindow message:error.message];
//
//     }view:keyWindow message:@"" needCache:NO userInteractionEnabled:NO];
}

- (void)countDown {

    self.enabled = NO;
    
    self.count--;
    
    NSString *intStr = [NSString stringWithFormat:@"%@秒",@(self.count)];
    [self setTitle:intStr forState:UIControlStateNormal];
    
    if (self.count == 0) {
        [self stopCountDown];
    }
}

- (void)stopCountDown {
    
    [self.timer invalidate];
    self.timer = nil;
    
    [self setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.enabled = YES;
    self.count = MAXSECOND;
}

@end
