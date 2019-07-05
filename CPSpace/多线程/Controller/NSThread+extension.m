//
//  NSThread+extension.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "NSThread+extension.h"
#import <objc/runtime.h>

@implementation NSThread (extension)

- (void)setThreadName:(NSString *)threadName {
    objc_setAssociatedObject(self, @selector(threadName), threadName, OBJC_ASSOCIATION_COPY);
}

- (NSString *)threadName {
    
    NSString * name = [NSThread currentThread].name;//objc_getAssociatedObject(self, @selector(threadName));
    if (name == nil) {
        name = @"--";
    }
    
    return name;
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY);
}

- (NSString *)name {
    
    NSString *threadName = objc_getAssociatedObject(self, @selector(name));
    if (nil == threadName) {
        threadName = @"未指定编程名称";
    }
    
    return threadName;
}

@end
