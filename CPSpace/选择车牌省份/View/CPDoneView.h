//
//  CPDoneView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/5/13.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPDoneView : UIToolbar

@property (nonatomic, copy) void (^doneActionBlock)(void);

@end

NS_ASSUME_NONNULL_END
