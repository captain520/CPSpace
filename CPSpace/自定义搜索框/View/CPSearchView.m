//
//  CPSearchView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/17.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPSearchView.h"
#import "CPTextFiled.h"

@interface CPSearchView () <UITextFieldDelegate>

@property (nonatomic, strong) CPTextFiled *textField;
@property (nonatomic, strong) UIButton * actionButton;


@end

@implementation CPSearchView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializedBaesProperties];
    }
    
    return self;
}

- (void)initializedBaesProperties {
//    self.backgroundColor = UIColor.orangeColor;
}

- (void)setupUI {
    
    {
        
        if (nil == _actionButton) {
            CGFloat width = [self widthOfActionName:_actionName fontSize:17];
            _actionButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width - 16 - width, 0, width, self.frame.size.height)];
            _actionButton.titleLabel.font = [UIFont systemFontOfSize:17];
            [_actionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:_actionButton];
        }
        
        [_actionButton setTitleColor:_actionNameColor forState:UIControlStateNormal];
        if (nil != _actionIcon) {
            _actionButton.frame = CGRectMake(self.bounds.size.width - 16 - self.bounds.size.height, 0, self.bounds.size.height, self.frame.size.height);
            [_actionButton setImage:_actionIcon forState:UIControlStateNormal];
            [_actionButton setTitle:nil forState:UIControlStateNormal];
        } else {
            [_actionButton setTitle:_actionName forState:UIControlStateNormal];
        }
    }
    
    {
        if (nil == _textField) {
            _textField = [[CPTextFiled alloc] initWithFrame:CGRectMake(16, 8, self.bounds.size.width - 2 * 16 - 0 -  _actionButton.bounds.size.width, 36)];
            _textField.placeholder = _placeHolder;
            _textField.font = [UIFont systemFontOfSize:15];
            _textField.center = CGPointMake(16 + _textField.bounds.size.width/2/*self.bounds.size.width - 2 * 16 - _actionButton.bounds.size.width*/, CGRectGetHeight(self.bounds)/2);
            _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            _textField.layer.borderWidth = .5;
            _textField.layer.borderColor = UIColor.groupTableViewBackgroundColor.CGColor;

            [self addSubview:_textField];
        }
        
        _textField.layer.cornerRadius = MIN(_textfieldCornerRadius, 18);
        
    }
}

- (void)setActionName:(NSString *)actionName {
    _actionName = actionName;
    
    [self setupUI];
}

- (void)setTextfieldCornerRadius:(CGFloat)textfieldCornerRadius {
    _textfieldCornerRadius = textfieldCornerRadius;
    
    [self setupUI];
}

- (void)setActionNameColor:(UIColor *)actionNameColor {
    _actionNameColor = actionNameColor;
    
    [self setupUI];
}

- (CGFloat)widthOfActionName:(NSString *)actionName fontSize:(CGFloat )fontSize {
    
    if (actionName == nil) {
        return 0;
    }
    
    CGRect rect = [actionName boundingRectWithSize:CGSizeMake(120, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize] } context:nil];
    
    return rect.size.width + 16;
}

- (void)buttonAction:(id)sender {
    if (nil == self.actionBlock) {
        self.textField.text = nil;
        [self.textField resignFirstResponder];
    } else {
        self.actionBlock();
    }
}

@end
