//
//  CPMutilThreadVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/29.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPMutilThreadVC.h"
#import "NSThread+extension.h"

@interface CPMutilThreadVC ()

@end

@implementation CPMutilThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self threadTest];
}

#pragma mark - NSThread

- (void)threadTest {
    NSThread *aThread = [[NSThread alloc] initWithTarget:self selector:@selector(test:) object:@"动态"];
    aThread.name = @"aThread";
    aThread.threadPriority = 1;

    [aThread start];
    
    [NSThread detachNewThreadSelector:@selector(test:) toTarget:self withObject:@"静态"];
    
    [self performSelectorInBackground:@selector(test:) withObject:@"隐式"];
}

- (void)test:(id)sender {
    NSLog(@"%@__%s__%@",[NSThread currentThread].name,__FUNCTION__,sender);
}

@end
