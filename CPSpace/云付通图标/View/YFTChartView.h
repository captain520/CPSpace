//
//  YFTChartView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/5/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YFTChartToastView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YFTChartView : UIView

- (id)initWithFrame:(CGRect)frame data:(NSArray *)dataArray;

@property (nonatomic, strong) NSArray <NSNumber *> * dataArray;

@property (nonatomic, strong) YFTChartToastView * toastLB;

@end

NS_ASSUME_NONNULL_END
