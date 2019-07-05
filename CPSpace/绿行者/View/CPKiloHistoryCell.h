//
//  CPKiloHistoryCell.h
//  CPSpace
//
//  Created by 王璋传 on 2019/2/19.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPKiloHistoryCell : UITableViewCell

@property (nonatomic, strong) UIView *vLine,*dotLine;

@property (nonatomic, strong) UILabel *timeLB;

@property (nonatomic, strong) UIImageView *avaterIV;

@property (nonatomic, strong) UILabel *nameLB;

@property (nonatomic, strong) UILabel *actionLB;

@property (nonatomic, strong) UIButton *prizeBT;

@property (nonatomic, strong) UILabel *kiloLB;

@end
