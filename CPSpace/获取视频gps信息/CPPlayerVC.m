//
//  CPPlayerVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/3/1.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPPlayerVC.h"
#import <AVFoundation/AVFoundation.h>

@interface CPPlayerVC ()

@property (nonatomic, strong) AVPlayer *player;
@property (strong, nonatomic)AVPlayerLayer *playerLayer;//播放界面（layer）

@end

@implementation CPPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.grayColor;
    
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = CGRectMake(0, 100, UIScreen.mainScreen.bounds.size.width, 200);
    self.playerLayer.backgroundColor = UIColor.purpleColor.CGColor;
    
    [self.view.layer addSublayer:self.playerLayer];
    
    UIButton *playerButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    playerButton.backgroundColor = UIColor.redColor;
    [playerButton addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:playerButton];
}

- (void)playAction:(id)sender {
//    [self.player play];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"FILE171122-141954-0001F.MOV" withExtension:@""];
    [self thumbnailImageForVideo:url atTime:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AVPlayer *)player {
    if (nil == _player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"FILE171122-141954-0001F.MOV" withExtension:@""];
        _player = [AVPlayer playerWithURL:url];
    }
    return _player;
}

- (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode =AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
    
    if(!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
    
    UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage:thumbnailImageRef] : nil;
    return thumbnailImage;
}

@end
