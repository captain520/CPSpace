//
//  CPVLCPlayer.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/27.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPVLCPlayer.h"
#import <MobileVLCKit/MobileVLCKit.h>

@interface CPVLCPlayer ()<VLCMediaPlayerDelegate>

@property (nonatomic, strong) VLCMediaPlayer * player;

@end

@implementation CPVLCPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailizeBaseProperties];
    [self setupUI];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"▶️" style:UIBarButtonItemStylePlain target:self action:@selector(playAndPauseAction:)];
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
    if (nil == self.player) {
        
        VLCMedia *media = [VLCMedia mediaWithURL:[NSURL URLWithString:@"http://oss.iviov.com/video/2019032516135011.ts"]];
        
        self.player = [[VLCMediaPlayer alloc] init];
        self.player.media = media;
        self.player.delegate = self;
        self.player.drawable = self.view;
    }

}
#pragma mark - Delegate && dataSource method implement
- (void)mediaPlayerTimeChanged:(NSNotification *)aNotification {
    VLCMediaPlayer  *mediaPlayer = aNotification.object;
    
    VLCTime *cachedTime = [mediaPlayer valueForKeyPath:@"cachedTime"];
    VLCTime *cachedRemainingTime = [mediaPlayer valueForKeyPath:@"cachedRemainingTime"];
    
//    VLCTime *totalTime = [VLCTime timeWithInt:(cachedTime.intValue + cachedRemainingTime.intValue)];
    VLCTime *totalTime = [VLCTime timeWithInt:(mediaPlayer.time.intValue - mediaPlayer.remainingTime.intValue)];

//    NSLog(@"%@",[mediaPlayer valueForKeyPath:@"cachedTime"]);
//    NSLog(@"%@",[mediaPlayer valueForKeyPath:@"cachedRemainingTime"]);
    NSLog(@"position : %f time:%@",mediaPlayer.position,mediaPlayer.time);
    NSLog(@"----------%@",totalTime);
}

- (void)mediaPlayerStateChanged:(NSNotification *)aNotification {
    switch (self.player.state) {
        case VLCMediaPlayerStateStopped:
        {
            NSLog(@"--------------- stop ---------------");
            [self.player stop];
        }
            
            break;
            
        default:
            break;
    }
}

#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (void)playAndPauseAction:(id)sender {
    if ([self.player isPlaying]) {
        [self.player pause];
    } else {
        [self.player play];
    }
}

@end
