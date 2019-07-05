//
//  CPActionSheet.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/5.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPActionSheet.h"

@interface CPActionSheet ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView * dataTableView;

@end


@implementation CPActionSheet

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle, ... {
    if (self = [super initWithFrame:CGRectZero]) {
        
    }
    
    return self;
}

- (void)setupUI {
    
}

- (void)show {
    
}

- (void)dimiss {
    
}

@end
