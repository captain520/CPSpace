//
//  CPSuccessFailTestVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/5.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPSuccessFailTestVC.h"
#import "CPLoadStatusToast.h"

@interface CPSuccessFailTestVC ()

@end

@implementation CPSuccessFailTestVC

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
- (IBAction)showSuccessAction:(id)sender {
    CPLoadStatusToast *loadingToast = [[CPLoadStatusToast alloc] initWithFrame:CGRectZero style:CPLoadStatusStyleLoadingSuccess];
    
    [loadingToast show];
}
- (IBAction)showFailAction:(id)sender {
    CPLoadStatusToast *loadingToast = [[CPLoadStatusToast alloc] initWithFrame:CGRectZero style:CPLoadStatusStyleFail];
    
    [loadingToast show];
}
- (IBAction)showLoadingAction:(id)sender {
    
    CPLoadStatusToast *loadingToast = [[CPLoadStatusToast alloc] initWithFrame:CGRectZero style:CPLoadStatusStyleLoading];
    
    [loadingToast show];

}

@end
