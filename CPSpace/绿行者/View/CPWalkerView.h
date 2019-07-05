//
//  CPWalkerView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/2/18.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPKiloView.h"

@interface CPWalkerView : UIImageView

@property (nonatomic, strong) UIImageView *wateringBt, *fertilizationBT, *disinsectionBT;
@property (nonatomic, strong) UIImageView *wateringGifIV, *fertilizationGifIV;
@property (nonatomic, strong) CPKiloView *totalKiloBT;
@property (nonatomic, strong) UIButton *medalBT, *strategyBT;

@property (nonatomic, strong) UIImageView *treeIV;

@property (nonatomic, strong) UIImageView *popIV;

@property (nonatomic, assign) NSInteger ballCount;

@end
