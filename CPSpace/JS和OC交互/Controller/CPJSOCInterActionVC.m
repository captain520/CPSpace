//
//  CPJSOCInterActionVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/21.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPJSOCInterActionVC.h"
#import <WebKit/WebKit.h>

@interface CPJSOCInterActionVC ()<WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation CPJSOCInterActionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
    [self loadData];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    
    self.view.backgroundColor = UIColor.whiteColor;
    
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    
    [self.view addSubview:self.webView];
    
    WKUserContentController *userCC = config.userContentController;
    
//    [userCC addScriptMessageHandler:self name:@"showMessage1111"];
    [userCC addScriptMessageHandler:self name:@"ocMethod"];
    [userCC addScriptMessageHandler:self name:@"strategyDivBtnClickEvent"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"OC->JS" style:UIBarButtonItemStyleDone target:self action:@selector(oc2JsAction:)];
}

- (void)setEditing:(BOOL)editing {
    [super setEditing:editing];
    
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - Delegate && dataSource method implement
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"%s", __FUNCTION__);
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"data.txt" ofType:nil];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [self.webView evaluateJavaScript:str completionHandler:nil];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"----------%@",message.name);
    
    [self pushVCWithClassString:@"CPGWCertificateVC" title:@"我的证书"];
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
   NSLog(@"%s", __FUNCTION__);
    completionHandler();
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    NSLog(@"%s", __FUNCTION__);
    completionHandler(YES);
}
#pragma mark - load data
- (void)loadData {
//    NSURL *url = [NSURL URLWithString:@"https://m.benlai.com/huanan/zt/1231cherry"];
    NSURL *url = [NSURL URLWithString:@"http://120.76.246.99:8088/hjs/index.html?plant=12"];
//    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/TestIndex"];
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement
- (void)oc2JsAction:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    
    NSString *js =
    @"function sayHello() {\
    alert('Hello funture');\
    }";

    [self.webView evaluateJavaScript:js completionHandler:nil];
}

@end
