//
//  CPTextView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/5/14.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPTextView : UITextView<UITextViewDelegate>

@property (nonatomic, strong) UILabel * placeHolderLB;
@property (nonatomic, strong) UILabel * limitLB;

@end

NS_ASSUME_NONNULL_END
