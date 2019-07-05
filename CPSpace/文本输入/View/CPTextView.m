//
//  CPTextView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/14.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTextView.h"

@implementation CPTextView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    self.font = [UIFont systemFontOfSize:14];

    if (nil == self.placeHolderLB) {

        self.placeHolderLB = [UILabel new];
        self.placeHolderLB.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.2];
        self.placeHolderLB.font = [UIFont systemFontOfSize:14];
        self.placeHolderLB.text = @"请输入不少于10字的描述";

        [self addSubview:self.placeHolderLB];
        [self.placeHolderLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(4);
        }];
    }
    
    if (nil == _limitLB) {
        self.limitLB  = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 100, 100)];
        self.limitLB.text = @"0/50";
        self.limitLB.font = [UIFont systemFontOfSize:12];
        self.limitLB.backgroundColor = UIColor.purpleColor;

        [self addSubview:self.limitLB];
        [self.limitLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(4);
            make.top.mas_equalTo(80);
            make.right.mas_equalTo(0);
        }];
        
        [self bringSubviewToFront:self.limitLB];
    }
}

- (CGRect)textRectForBounds {
    return CGRectZero;
}
#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"%s", __FUNCTION__);
}

- (void)textViewDidChange:(UITextView *)textView {
   NSLog(@"%s", __FUNCTION__);
    
    self.placeHolderLB.hidden = textView.text.length > 0;
    self.limitLB.text = [NSString stringWithFormat:@"%@/50",@(textView.text.length)];
}

@end
