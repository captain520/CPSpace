//
//  CPFlipAnimationVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/9.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPFlipAnimationVC.h"

@interface CPFlipAnimationVC ()

@end

@implementation CPFlipAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)flipAction:(id)sender {
    
    [UIView transitionWithView:self.testView duration:1.0f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
    } completion:^(BOOL finished) {
        
    }];

}

@end
