//
//  NSObject+AssociatedObject.h
//  CPSpace
//
//  Created by 王璋传 on 2019/3/28.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AssociatedObject)

@property (nonatomic, strong) NSNumber *associatedObject;

@end

NS_ASSUME_NONNULL_END
