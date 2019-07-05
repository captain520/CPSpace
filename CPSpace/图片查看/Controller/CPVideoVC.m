//
//  CPVideoVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/15.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPVideoVC.h"
#import <AVFoundation/AVFoundation.h>

@interface CPVideoVC ()

@property (nonatomic, strong) AVPlayer *player;
@property (strong, nonatomic) AVPlayerLayer *playerLayer;//播放界面（layer）
@property (nonatomic, strong) UIButton *replayBT;

@end

@implementation CPVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    
    [self setupUI];
}

- (void)dealloc {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.player.rate == 0) {
        [self replayAction:nil];
    } else {
        self.replayBT.hidden = NO;
        [self.player play];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player pause];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.blackColor;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playToEndSignal:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

}
#pragma mark - setter && getter method

- (AVPlayerLayer *)playerLayer {
    
    if (nil == _playerLayer) {
        
        CGFloat width = UIScreen.mainScreen.bounds.size.width;
        CGFloat height = width * 4 / 3;
        
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.frame = CGRectMake(0, self.view.center.y - height/2, width, height);
        _playerLayer.backgroundColor = UIColor.blackColor.CGColor;
    }
    
    return _playerLayer;
}

- (AVPlayer *)player {
    if (nil == _player) {
        
        NSURL *url = nil;
        if ([self.urlStr containsString:@"http"]) {
            //  网络
            url = [NSURL URLWithString:_urlStr];
        } else if([self.urlStr containsString:@"file"]){
            //  沙盒路径
            url = [NSURL fileURLWithPath:_urlStr];
        } else {
            //  工程资源
            url = [[NSBundle mainBundle] URLForResource:self.urlStr withExtension:@""];
        }
        
        _player = [AVPlayer playerWithURL:url];
    }
    return _player;
}

- (UIButton *)replayBT {
    
    if (nil == _replayBT) {
        _replayBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _replayBT.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        _replayBT.layer.cornerRadius = 10;
        _replayBT.center = self.view.center;
        [_replayBT setImage:[UIImage imageNamed:@"replayWhite"] forState:UIControlStateNormal];
        [_replayBT addTarget:self action:@selector(replayAction:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:_replayBT];
    }
    
    return _replayBT;
}
#pragma mark - Setup UI
- (void)setupUI {
    [self.view.layer insertSublayer:self.playerLayer atIndex:0];
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement
- (void)replayAction:(id)sender {
    
    [self.player seekToTime:kCMTimeZero completionHandler:^(BOOL finished) {
        [self.player play];
        self.replayBT.hidden = YES;
    }];
}

- (void)playToEndSignal:(NSNotification *)ntf {
    self.replayBT.hidden = NO;
}

@end
