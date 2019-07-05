//
//  CPImageVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/15.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPImageVC.h"
#import <SDWebImageManager.h>

@interface CPImageVC ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGFloat scale;

@end

@implementation CPImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.scale = 1.;
    self.view.backgroundColor = UIColor.blackColor;
}
#pragma mark - setter && getter method

#pragma mark - Setup UI
- (void)setupUI {
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width * 4 / 3)];
    self.imageView.center = self.view.center;
    self.imageView.userInteractionEnabled = YES;
    
    [self.view addSubview:self.imageView];
    
    //  双击
    [self tapGst];
    //  捏放
    [self pinGst];
    //  移动
    [self panGst];
    
    NSURL *url = nil;
    if ([self.urlStr containsString:@"http"]) {
        //  网络图片
        url = [NSURL URLWithString:_urlStr];
    } else if([self.urlStr containsString:@"file"]){
        //  沙盒路径图片
        url = [NSURL fileURLWithPath:_urlStr];
    } else {
        //  工程资源图片
        self.imageView.image = [UIImage imageNamed:self.urlStr];
        return;
    }
    
    //  获取网络图片
    __weak typeof(self) weakSelf = self;
    
    [[SDWebImageManager sharedManager] loadImageWithURL:url options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        [weakSelf updateImageView:image];
    }];
}

- (void)dealloc {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/**
 更新图片

 @param image 图片资源
 */
- (void)updateImageView:(UIImage *)image {
    
    CGFloat width = image.size.width > UIScreen.mainScreen.bounds.size.width - 20 ?  UIScreen.mainScreen.bounds.size.width - 20 : image.size.width;
    
    CGFloat height = width * image.size.height / image.size.width;
    
    self.imageView.image = image;
    self.imageView.frame = CGRectMake(0, 0, width, height);
    self.imageView.center = self.view.center;
    
}

//  双击手势
- (void)tapGst {
   
    UITapGestureRecognizer *tapGst = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tapGst.numberOfTapsRequired = 2;

    [self.imageView addGestureRecognizer:tapGst];
}

- (void)tapAction:(UITapGestureRecognizer *)gst {
    NSLog(@"%s", __FUNCTION__);
    UIView *targetView = gst.view;
    
    [UIView animateWithDuration:.25 animations:^{
        CGFloat scaleFactor = self.scale != 1 ? 1 : 1.5;
        self.scale = scaleFactor;
        targetView.transform = CGAffineTransformMakeScale(scaleFactor , scaleFactor);
    } completion:^(BOOL finished) {
        
    }];
}

//  缩放手势
- (void)pinGst {
    UIPinchGestureRecognizer *pinGst = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinAction:)];
    [self.imageView addGestureRecognizer:pinGst];
}

- (void)pinAction:(UIPinchGestureRecognizer *)gst {
    NSLog(@"%s", __FUNCTION__);

    UIView *targetView = gst.view;
    
    [UIView animateWithDuration:.25 animations:^{
        CGFloat scaleFactor = gst.scale;//self.scale > 1. ? 1 : 2;
        self.scale = scaleFactor;
        targetView.transform = CGAffineTransformMakeScale(scaleFactor , scaleFactor);
    } completion:^(BOOL finished) {
        
    }];
}

//  平移手势
- (void)panGst {
    
    UIPanGestureRecognizer *panGst = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self.imageView addGestureRecognizer:panGst];
}

- (void)panAction:(UIPanGestureRecognizer *)gst {
    
    NSLog(@"%s", __FUNCTION__);
    
    UIView *targetView = gst.view;
    CGPoint translation = [gst translationInView:targetView];

    //  平移
    targetView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, translation.x, translation.y);
    //  保持之前的缩放
    targetView.transform = CGAffineTransformScale(targetView.transform, self.scale, self.scale);
}


#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement


@end
