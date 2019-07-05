//
//  CPActionSheetTestVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/5.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPActionSheetTestVC.h"
#import "CPDownloadActionSheet.h"

@interface CPActionSheetTestVC ()

@property (nonatomic, strong) CPDownloadActionSheet *downloadActionSheet;;

@end

@implementation CPActionSheetTestVC

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

- (IBAction)showActionSheet:(id)sender {
    if (nil == self.downloadActionSheet) {
        self.downloadActionSheet = [CPDownloadActionSheet new];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];

    [self.downloadActionSheet show];
}

- (IBAction)stepAction:(UIStepper *)sender {
    
}

- (void)timeAction:(NSTimer *)timer {
    if (self.downloadActionSheet.percent > 1) {
        [timer invalidate];
    } else {
        self.downloadActionSheet.percent += 0.05;
    }
}

@end
