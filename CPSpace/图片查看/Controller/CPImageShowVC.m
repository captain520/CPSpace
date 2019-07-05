//
//  CPImageShowVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/15.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPImageShowVC.h"
#import "CPImageVC.h"
#import "CPVideoVC.h"

@interface CPImageShowVC ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) UIPageViewController * pageVC;
@property (nonatomic, strong) NSMutableArray <UIViewController *> *viewControllers;
@property (nonatomic, strong) UIPageControl * pageControl;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) UIButton *backBt;

@end

@implementation CPImageShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.urlStrs = @[
                     @"http://e.hiphotos.baidu.com/image/pic/item/fc1f4134970a304e210531d0dfc8a786c9175cf0.jpg",
                     @"http://d.hiphotos.baidu.com/image/pic/item/e61190ef76c6a7ef7d58560df3faaf51f3de669b.jpg",
                     @"http://a.hiphotos.baidu.com/image/pic/item/5ab5c9ea15ce36d35dc3751934f33a87e850b1d0.jpg",
                     ];
    
    [self initailizeBaseProperties];
}

- (void)dealloc {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.blackColor;
//    self.canCircleScroll = YES;
    
    [self initControllers];
    
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    
    self.pageControl.numberOfPages = self.viewControllers.count;
    [self.backBt addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initControllers {
    
    self.viewControllers = @[].mutableCopy;
    
    [self.urlStrs enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 1) {
            
            CPVideoVC *vc = [[CPVideoVC alloc] init];
            vc.urlStr = @"http://bbsf-test-file.hzxb.net/upload/media/201903/848ff838-c496-48a0-bce5-3c97038fb035.mov";
            
            [self.viewControllers addObject:vc];
            
        } else {
            
            CPImageVC *vc = [[CPImageVC alloc] init];
            vc.urlStr = obj;
            vc.title = [NSString stringWithFormat:@"%@",@(idx)];
            
            [self.viewControllers addObject:vc];
        }
    }];

    [self.pageVC setViewControllers:@[self.viewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
}

#pragma mark - setter && getter method

- (UIPageViewController *)pageVC {
    if (nil == _pageVC) {
        _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageVC.delegate = self;
        _pageVC.dataSource = self;
    }
    
    return _pageVC;
}

- (UIPageControl *)pageControl {
    
    if (nil == _pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 100, UIScreen.mainScreen.bounds.size.width, 60)];
        [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
//        _pageControl.userInteractionEnabled = NO;

        [self.view addSubview:_pageControl];
    }
    
    return _pageControl;
}

- (UIButton *)backBt {
    
    if (nil == _backBt) {
        _backBt = [[UIButton alloc] initWithFrame:CGRectMake(0, UIApplication.sharedApplication.statusBarFrame.size.height, UIScreen.mainScreen.bounds.size.width, 44)];
        _backBt.backgroundColor = UIColor.clearColor;
        _backBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_backBt setTitleEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 0)];
        [self addBackIndictor];
        [_backBt setTitleEdgeInsets:UIEdgeInsetsMake(0, 16 + 12 + 8, 0, 0)];
        [_backBt setTitle:@"返回" forState:UIControlStateNormal];

        [self.view addSubview:_backBt];
    }
    
    return _backBt;
}

- (void)addBackIndictor {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0 + 12, 12)];
    [path addLineToPoint:CGPointMake(0 , 22)];
    [path addLineToPoint:CGPointMake(0 + 12, 32)];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.frame = CGRectMake(16, 0, 100, 36);
    layer.fillColor = UIColor.clearColor.CGColor;
    layer.lineWidth = 1;
    layer.strokeColor = UIColor.whiteColor.CGColor;

    [_backBt.layer insertSublayer:layer atIndex:0];
}

#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    NSLog(@"%s", __FUNCTION__);
    if (YES == completed) {
        NSInteger currentIndex = [self.viewControllers indexOfObject:self.pageVC.viewControllers.firstObject];
        
        self.pageControl.currentPage = currentIndex;
    }
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    
//    NSLog(@"before %@",@(index));
    if (index == 0 || index == NSNotFound) {
        if ( YES == self.canCircleScroll) {
            return self.viewControllers.lastObject;
        } else {
            return nil;
        }
    }

    return self.viewControllers[index - 1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {

    NSInteger index = [self.viewControllers indexOfObject:viewController];

//    NSLog(@"after %@",@(index));
    if (index >= self.viewControllers.count - 1) {
        
        if ( YES == self.canCircleScroll) {
            return self.viewControllers.firstObject;
        } else {
            return nil;
        }
    }

    return self.viewControllers[index + 1];
}

#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (void)pageControlAction:(UIPageControl *)pc {
   
    [self.pageVC setViewControllers:@[self.viewControllers[pc.currentPage]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
}

- (void)backAction:(id)sender {
    if (nil == [self.navigationController popViewControllerAnimated:YES]) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

@end
