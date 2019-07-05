//
//  CPTestVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/25.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPTestVC.h"
#import "CPTest2VC.h"
#import "CPTestObject.h"
#import "CPTestObject.h"
#import "NSObject+AssociatedObject.h"
#import <objc/runtime.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface CPTestVC ()

@property (nonatomic, strong) UIButton * testButton;

@property (nonatomic, strong) UITextField * testTF;

@end

@implementation CPTestVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
//    UIActivityViewController;

    
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointMake(100, 100)];
    [path0 addLineToPoint:CGPointMake(200, 200)];
    
    CAShapeLayer *lineShape = [CAShapeLayer layer];
    lineShape.path = path0.CGPath;
    lineShape.strokeColor = UIColor.redColor.CGColor;
    lineShape.fillColor = UIColor.clearColor.CGColor;
    lineShape.lineWidth = 5;
    
    [self.view.layer addSublayer:lineShape];
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:10 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    CAShapeLayer *circleShape = [CAShapeLayer layer];
    circleShape.path = path1.CGPath;
    circleShape.strokeColor = UIColor.greenColor.CGColor;
    circleShape.fillColor = UIColor.orangeColor.CGColor;
    circleShape.lineWidth = 5;
    
    [self.view.layer addSublayer:circleShape];
    
//    lineShape.mask = circleShape;
    circleShape.mask = lineShape;


    return;
    // Do any additional setup after loading the view.
    
//    extern NSInteger age;
//
//    NSLog(@"------------------------------:%ld",age);
    
//    [self initailizeBaseProperties];
//    [self setupUI];
    
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    if (nil == self.testTF) {
        self.testTF = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
        self.testTF.borderStyle = UITextBorderStyleRoundedRect;
//        [self.testTF addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventEditingDidEnd];
        RACSignal *signal = [self.testTF rac_signalForControlEvents:UIControlEventEditingDidEnd];
        
        [[self.testTF rac_signalForControlEvents:UIControlEventEditingDidEnd] subscribeNext:^(id x) {
            NSLog(@"------------------------------");
        }];
//        [[RACSignal alloc] subscribeNext:^(id x) {
//            NSLog(@"")
//        } completed:^{
//
//        }];

        [self.view addSubview:self.testTF];
    }
    
    

//    [self testAction:nil];
}

- (void)doneAction:(id)sender {
    NSLog(@"------------------------------");
}

- (void)testAction:(id)sender {
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    unsigned int count = 0;
    
    objc_property_t *properties = class_copyPropertyList(tableView.class, &count);
    Method *ms = class_copyMethodList(tableView.class, &count);

    NSMutableArray *propertyNames = @[].mutableCopy;
    NSMutableArray *methodsNames = @[].mutableCopy;
    
    for (NSInteger i = 0; i < count; ++i) {
//        objc_property_t p = properties[i];
//        [propertyNames addObject:[NSString stringWithUTF8String:property_getName(p)]];
        Method m = ms[i];
//        [methodsNames addObject:[NSString stringWithUTF8String:method_getName(m)]];
        [methodsNames addObject:NSStringFromSelector(method_getName(m))];
    }

    NSLog(@"");
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;

    
    NSMutableArray *employees = @[].mutableCopy;
    
    CPTestObject *obj0 = [[CPTestObject alloc] init];
    obj0.testValue = 12;
    obj0.testDate = @"2010-10-20";
    [employees addObject:obj0];
    
    CPTestObject *obj1 = [[CPTestObject alloc] init];
    obj1.testValue = 8;
    obj1.testDate = @"2011-01-20";
    [employees addObject:obj1];

    NSLog(@"%@",[employees valueForKeyPath:@"@sum.testValue"]);
    NSLog(@"%@",[employees valueForKeyPath:@"@avg.testValue"]);
    NSLog(@"%@",[employees valueForKeyPath:@"@count.testValue"]);
    NSLog(@"%@",[employees valueForKeyPath:@"@max.testValue"]);
    NSLog(@"%@",[employees valueForKeyPath:@"@min.testValue"]);
    
    NSLog(@"%@",[employees valueForKeyPath:@"@max.testDate"]);
    NSLog(@"%@",[employees valueForKeyPath:@"@min.testDate"]);
    

    NSLog(@"------------------------------");
    NSArray *testNumber = @[@1,@2,@3,@4,@5,@6,@7,@1,@1,@2,@3];
    id ret = [testNumber valueForKeyPath:@"@unionOfObjects.self"];
    id ret1 = [testNumber valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"%@",[testNumber valueForKeyPath:@"@distinctUnionOfObjects.self"]);
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"count" style:UIBarButtonItemStyleDone target:self action:@selector(countAction:)];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    button.backgroundColor = UIColor.redColor;
//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(testMethod) forControlEvents:UIControlEventTouchUpInside];

    NSLog(@"----------:%ld",CFGetRetainCount((__bridge CFTypeRef)(button)));
    
    [self.view addSubview:button];
    
    NSLog(@"----------:%ld",CFGetRetainCount((__bridge CFTypeRef)(button)));
    
//    [button removeFromSuperview];
//    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [obj removeFromSuperview];
//    }];

    NSLog(@"----------:%ld",CFGetRetainCount((__bridge CFTypeRef)(button)));

}

- (void)buttonAction:(id)sender {
    
    CPTest2VC *vc = [[CPTest2VC alloc] init];
    NSLog(@"----------:%ld",CFGetRetainCount((__bridge CFTypeRef)(vc)));
//    vc.actionBlock = ^{
//        self.view.backgroundColor = UIColor.redColor;
//    };

    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"----------:%ld",CFGetRetainCount((__bridge CFTypeRef)(vc)));
    NSLog(@"----------:%ld",CFGetRetainCount((__bridge CFTypeRef)(self)));
}

- (void)countAction:(id)sender {
    NSLog(@"----------:%ld",CFGetRetainCount((__bridge CFTypeRef)(self)));
}

#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (void)testMethod {
    static NSString *testValue = @"hello";
    NSLog(@"%@",testValue);
    testValue = @"world";
    NSLog(@"%@",testValue);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.testTF resignFirstResponder];
}

@end
