//
//  CPSemaphoreVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPSemaphoreVC.h"

@interface CPSemaphoreVC ()

@end

@implementation CPSemaphoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self dispatchQueueTest];
    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(15, queue, ^(size_t index) {
        NSLog(@"%ld %@",index, [NSThread currentThread]);
    });
    
    NSLog(@"------------------------------");
}

/***************************** 异步队列 *******************************/
- (void)dispatchQueueTest {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"0 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"1 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"2 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"3 %@",[NSThread currentThread]);
    });
}

/***************************** 异步组 *******************************/
- (void)dispatchGroupTest {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"task 0 %@",[NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        });
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    dispatch_group_async(group, queue, ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"task 1 %@",[NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        });
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    dispatch_group_async(group, queue, ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"task 2 %@",[NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        });
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    dispatch_group_async(group, queue, ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"task 3 %@",[NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        });
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    dispatch_group_notify(group, queue, ^{
        NSLog(@"done %@",[NSThread currentThread]);
    });
}

@end
