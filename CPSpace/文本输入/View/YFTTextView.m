//
//  YFTTextView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/14.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "YFTTextView.h"

@implementation YFTTextView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    if ( nil == self.textView ) {
        self.textView = [UITextView new];
        self.textView.font = [UIFont systemFontOfSize:14];
        self.textView.delegate = self;
        self.textView.backgroundColor = UIColor.groupTableViewBackgroundColor;

        [self addSubview:self.textView];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
    
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
        self.limitLB  = [UILabel new];
        self.limitLB.text = @"0/50";
        self.limitLB.font = [UIFont systemFontOfSize:12];
        self.limitLB.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];

        [self addSubview:self.limitLB];
        [self.limitLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-8);
        }];
        
        [self bringSubviewToFront:self.limitLB];
    }
    
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

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@""]) {
        return YES;
    }
    
    return textView.text.length < 50;
}

@end
