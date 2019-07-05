//
//  CPTextFiled.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/17.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTextFiled.h"

@implementation CPTextFiled

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, bounds.size.height/2, 0);
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, bounds.size.height/2, 0);
}


- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, bounds.size.height/2, 0);
}



@end
