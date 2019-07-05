//
//  CPImagePickerDemoVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/6/26.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPImagePickerDemoVC.h"

@interface CPImagePickerDemoVC ()<UINavigationBarDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImagePickerController * imagePicker;

@end

@implementation CPImagePickerDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePicker.delegate = self;
//    self.imagePicker.allowsEditing = YES;
    self.imagePicker.showsCameraControls = NO;
    
    
//    UIView *overlayView = [UIView new];
//    overlayView.backgroundColor = UIColor.blueColor;
//    overlayView.frame = CGRectMake(100, 100, 100, 100);

    
//    self.imagePicker.cameraOverlayView = overlayView;
//    self.imagePicker.cameraViewTransform = CGAffineTransformMakeRotation(M_PI_4);
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    UIButton *actionBT = [UIButton new];
    actionBT.backgroundColor = UIColor.redColor;
    [actionBT addTarget:self action:@selector(buttonAction:) forControlEvents:64];
    
    [self.view addSubview:actionBT];
    [actionBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"相机",@"相册"]];
    [seg addTarget:self action:@selector(segAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:seg];
    [seg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(actionBT.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];

}
#pragma mark - Delegate && dataSource method implement

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    self.view.layer.contents = (id)image.CGImage;
    
    picker.cameraOverlayView.layer.contents = (id)image.CGImage;

    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
   NSLog(@"%s", __FUNCTION__);
}

#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (void)buttonAction:(id)sender {
   NSLog(@"%s", __FUNCTION__);
    
    [self presentViewController:self.imagePicker animated:YES completion:^{
        
    }];
}


- (void)segAction:(UISegmentedControl *)seg {
    NSLog(@"%s", __FUNCTION__);
    switch (seg.selectedSegmentIndex) {
        case 0:
            self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case 1:
            self.imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            break;
            
        default:
            break;
    }
}

@end
