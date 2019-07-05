//
//  CPSearchView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/3/17.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPSearchView : UIView

@property (nonatomic, copy) NSString *actionName;
@property (nonatomic, copy) NSString * placeHolder;
@property (nonatomic, assign) CGFloat textfieldCornerRadius;
@property (nonatomic, strong) UIColor * actionNameColor;
@property (nonatomic, strong) UIImage *actionIcon;

@property (nonatomic, copy) void (^actionBlock)(void);

@end

NS_ASSUME_NONNULL_END
