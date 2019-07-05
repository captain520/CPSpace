//
//  CPCarDistrictCollectionView.h
//  CPSpace
//
//  Created by 王璋传 on 2019/5/13.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPCarDistrictCollectionView : UICollectionView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

@property (nonatomic, copy) NSString * selectedDistrict;

@property (nonatomic, copy) void (^selectedBlock)(void);

@end

NS_ASSUME_NONNULL_END
