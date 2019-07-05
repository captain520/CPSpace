//
//  CPCarDistrictCollectionView.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/13.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPCarDistrictCollectionView.h"

@implementation CPCarDistrictCollectionView {
    NSArray <NSString *> *provincenames;
}

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self initailizeBaseProperties];
        [self setupUI];
    }
    
    return self;
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    NSString *districtStr = @"京,沪,浙,苏,粤,鲁,晋,冀,豫,川,渝,辽,吉,黑,皖,鄂,湘,赣,闽,陕,甘,宁,蒙,津,贵,云,桂,琼,青,新,藏";
    provincenames = [districtStr componentsSeparatedByString:@","];
    
    self.delegate = self;
    self.dataSource = self;
    
    self.backgroundColor = UIColor.groupTableViewBackgroundColor;
    self.scrollEnabled = NO;
}
#pragma mark - setter && getter method

- (void)setSelectedDistrict:(NSString *)selectedDistrict {
    _selectedDistrict = selectedDistrict;
    
    [provincenames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:selectedDistrict]) {
            self.selectedIndexPath = [NSIndexPath indexPathForRow:idx inSection:0];
            
            *stop = YES;
        }
    }];
}
#pragma mark - Setup UI
- (void)setupUI {
    [self registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"UICollectionViewCell"];
}
#pragma mark - Delegate && dataSource method implement
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return provincenames.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = UIColor.whiteColor;
//    cell.contentView.backgroundColor = UIColor.redColor;
    UILabel *titlLB = [cell.contentView viewWithTag:1000];
    if (nil == titlLB) {
        titlLB = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
        titlLB.tag = 1000;
        titlLB.textAlignment = NSTextAlignmentCenter;
        titlLB.backgroundColor = UIColor.clearColor;
        
        [cell.contentView addSubview:titlLB];
    }
    
    UIView *selectBgView = [[UIView alloc] initWithFrame:cell.bounds];
    selectBgView.backgroundColor = UIColor.redColor;
    cell.selectedBackgroundView = selectBgView;

    titlLB.text = provincenames[indexPath.row];
    
    cell.selected = indexPath.row == self.selectedIndexPath.row;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (UIScreen.mainScreen.bounds.size.width - 2) / 3;

    return CGSizeMake(width, width);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedIndexPath = indexPath;
    self.selectedDistrict = provincenames[indexPath.row];
    
    [collectionView reloadData];
}

#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

@end
