//
//  CPPaoPaoView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/3/14.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPPaoPaoView : UIView

@property (nonatomic, strong) UILabel * titleLB;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subTitle;

@property (nonatomic, copy) NSAttributedString *attrText;

@property (nonatomic, assign) NSTextAlignment alignment;

@end

NS_ASSUME_NONNULL_END
