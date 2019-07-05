//
//  ZZSOSItemsView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/4/1.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPImageTitleButton.h"
#import "CPActionButton.h"

/**
 界面类型

 - CPSOSItemActionTypeUnBuy: 未购买
 - CPSOSItemActionTypeUnPaid: 购买未支付
 - CPSOSItemActionTypePaid: 已购买
 - CPSOSItemActionTypeOverDue: 已过期
 - CPSOSItemActionTypeReserved: 预留
 */
typedef NS_ENUM(NSUInteger, CPSOSItemActionType) {
   CPSOSItemActionTypeUnBuy,
   CPSOSItemActionTypeUnPaid,
   CPSOSItemActionTypePaid,
   CPSOSItemActionTypeOverDue,
   CPSOSItemActionTypeReserved
};

NS_ASSUME_NONNULL_BEGIN

@interface ZZSOSItemsView : UIView

@property (nonatomic, assign) CPSOSItemActionType type;

@property (nonatomic, strong) UILabel * hintLabel;
@property (nonatomic, strong) CPActionButton * actionButton;

@property (nonatomic, copy) NSString * hintMessage;
@property (nonatomic, copy) NSString * actionTittle;
@property (nonatomic, strong) UIImageView * maskImageView;

@property (nonatomic, copy) void (^actionBlock)(NSUInteger tag);


@end

NS_ASSUME_NONNULL_END
