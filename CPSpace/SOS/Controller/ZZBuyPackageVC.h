//
//  ZZBuyPackageVC.h
//  CPSpace
//
//  Created by 王璋传 on 2019/4/1.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTableBaseVC.h"
#import "CPActionButton.h"

typedef NS_ENUM (NSUInteger, ZZBuyPackageCellInputType) {
    ZZBuyPackageCellInputTypeDefault,
    ZZBuyPackageCellInputTypeNumber
};

NS_ASSUME_NONNULL_BEGIN

@interface ZZBuyPackageVC : CPTableBaseVC

@end

@interface ZZBuyPackageCell : UITableViewCell

@property (nonatomic, strong) UILabel *hintLabel;
@property (nonatomic, strong) UITextField *inputMessageTF;
@property (nonatomic, assign) ZZBuyPackageCellInputType type;

@property (nonatomic, assign) BOOL needSendeCode;
@property (nonatomic, assign) BOOL needScanIMEI;
@property (nonatomic, assign) BOOL noAction;

@end

@interface ZZBuyPackageActionView : UIView

@property (nonatomic, strong) CPActionButton *actionButton;
@property (nonatomic, strong) UILabel * amountLabel;

@end

NS_ASSUME_NONNULL_END
