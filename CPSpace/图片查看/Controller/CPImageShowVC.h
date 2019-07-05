//
//  CPImageShowVC.h
//  CPSpace
//
//  Created by 王璋传 on 2019/3/15.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface CPImageShowVC : CPBaseVC

@property (nonatomic, strong) NSArray <NSString *> *urlStrs;

@property (nonatomic, assign) BOOL canCircleScroll;

@end

NS_ASSUME_NONNULL_END
