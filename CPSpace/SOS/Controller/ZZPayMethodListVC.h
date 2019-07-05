//
//  ZZPayMethodListVC.h
//  CPSpace
//
//  Created by 王璋传 on 2019/4/4.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPBaseTableVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZPayMethodListVC : CPBaseTableVC

@property (nonatomic, assign) CGFloat amount;

@end

@interface ZZPayMethodListCell : UITableViewCell

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * messageLabel;
@property (nonatomic, strong) UIImageView * checkImageView;

@end

NS_ASSUME_NONNULL_END
