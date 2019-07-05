//
//  CPAttributeVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/5/8.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPAttributeVC.h"

@interface CPAttributeVC ()

@end

@implementation CPAttributeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSArray *tempArray = @[@"0",@"1",@"2",@"3"];
    
    NSLog(@"%@",tempArray.reverseObjectEnumerator.allObjects);
    
//    tempArray.reverseObjectEnumerator.allObjectsdd

    [self setupUI];
}

- (void)setupUI {
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 80)];
    testLabel.numberOfLines = 0;
//    testLabel.backgroundColor = UIColor.redColor;

    [self.view addSubview:testLabel];
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.bounds = CGRectMake(0, 0, 10, 10);
    attachment.image = [UIImage imageNamed:@"bubble_tipsi_icon"];
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] init];
    NSAttributedString *attachmentAttr = [NSAttributedString attributedStringWithAttachment:attachment];
    [attr appendAttributedString:attachmentAttr];
    
    
    NSAttributedString *messageAttr = [[NSAttributedString alloc] initWithString:@" 尊敬的车主，若您买的设备已经包含救援服务套餐，点击“立即购买”填写资料去激活，不需再支付费用。" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
    [attr appendAttributedString:messageAttr];

    testLabel.attributedText = attr;
}


@end
