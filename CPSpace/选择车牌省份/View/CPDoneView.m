//
//  CPDoneView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/13.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPDoneView.h"

@implementation CPDoneView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:self
                                                                              action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                 style:0
                                                                target:self
                                                                action:@selector(doneAction:)];
    
    self.items = @[flexItem,doneItem];
    
}

- (void)doneAction:(id)sender {
    !self.doneActionBlock ? : self.doneActionBlock();
}

@end
