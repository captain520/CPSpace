//
//  CPLockVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/7/4.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPLockVC.h"

@interface CPLockVC ()

@end

@implementation CPLockVC

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initailizeBaseProperties];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
   
#if 0
    //  打印引用计数
    NSDate *date = [NSDate date];
    
    NSLog(@"retainCount:%@",@(CFGetRetainCount((__bridge CFTypeRef)date)));

    @synchronized (self) {
        NSLog(@"retainCount:%@",@(CFGetRetainCount((__bridge CFTypeRef)date)));
    }
    
#endif
    
    dispatch_queue_t queue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);
    
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    for (NSInteger i = 0; i < 10; ++i) {
        int ret = arc4random()%3;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(ret * NSEC_PER_SEC)), queue, ^{
            NSLog(@"%@",@(i));
//            dispatch_semaphore_signal(semaphore);
        });
        
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }
    
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement


@end
