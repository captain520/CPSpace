//
//  CPHealthKitManager.h
//  CPSpace
//
//  Created by 王璋传 on 2019/3/11.
//  Copyright © 2019 王璋传. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface CPHealthKitManager : NSObject

/**
 * 健康单例
 */
+ (instancetype)sharedInstance;

/**
 * 检查是否支持获取健康数据
 */
- (void)authorizeHealthKit:(void(^)(BOOL success, NSError *error))compltion;

/**
 * 获取步数
 */
- (void)getStepCount:(void(^)(NSString *stepValue, NSError *error))completion;

/**
 * 获取睡眠
 */
- (void)getSleepCount:(void(^)(NSString *sleepValue, NSError *error))completion;

- (void)getLast3DaysStepCount:(void(^)(NSMutableArray *stepValue, NSError *error))completion beforeDays:(NSInteger)beforeDays result:(NSMutableArray *)stepResults;
    
@end
