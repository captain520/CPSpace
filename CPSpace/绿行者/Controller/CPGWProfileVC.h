//
//  CPGWProfileVC.h
//  CPSpace
//
//  Created by 王璋传 on 2019/3/25.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "PageBaseVC.h"
#import <CPTableBaseVC.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPGWProfileVC : CPTableBaseVC

@end

@interface CPGWProfileHeader : UITableViewHeaderFooterView

@end


@interface CPWWProfileCell : UITableViewCell

@property (nonatomic, strong) UIImageView * imageIV;
@property (nonatomic, strong) UILabel * titleLB;
@property (nonatomic, strong) UILabel * subTitleLB;

@end

NS_ASSUME_NONNULL_END
