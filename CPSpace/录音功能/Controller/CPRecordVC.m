//
//  CPRecordVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/6/3.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPRecordVC.h"
#import <AVFoundation/AVFoundation.h>

@interface CPRecordVC ()<AVAudioRecorderDelegate>

@property (nonatomic, strong) AVAudioRecorder *recorder;

@end

@implementation CPRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initailizeBaseProperties];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    
    NSString *filePath = [self creatFilePath];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *outError = nil;
    
    NSDictionary *setting = [self getAudioSetting];
    
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:setting error:&outError];
    self.recorder.delegate = self;
    if (nil == outError) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord error:nil];
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
        
        [self.recorder prepareToRecord];
    }
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

- (NSString *)audioDocmentPath
{
    NSString *homePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *docPath = [homePath stringByAppendingPathComponent:@"音频录制文件夹001"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:docPath])
    {
        NSLog(@"文件夹已经存在,不需要创建");
    }
    else
    {
        NSError *error = nil;
        if ([[NSFileManager defaultManager] createDirectoryAtPath:docPath
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:&error])
        {
            NSLog(@"创建文件夹成功");
        }
        else {
            NSLog(@"创建文件夹失败：%@",error);
        }
    }
    return docPath;
}

- (NSString *)creatFilePath {
    //为了不覆盖上次的录制内容，每次生成一个新的时间戳，作为新文件名
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSString *timeStr = [NSString stringWithFormat:@"%f",timeStamp];
    NSString *newFilePath = [[self audioDocmentPath] stringByAppendingPathComponent:timeStr];
    if (![[NSFileManager defaultManager] fileExistsAtPath:newFilePath])
    {
        if ([[NSFileManager defaultManager] createFileAtPath:newFilePath contents:nil attributes:nil])
        {
            NSLog(@"文件地址创建成功!");
        }
        else {
            NSLog(@"文件地址创建失败!");
        }
    }
    return newFilePath;
}

//  获取录音文件设置
- (NSMutableDictionary *)getAudioSetting
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //设置录音格式
    [dict setObject:@(kAudioFormatMPEG4AAC) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
    [dict setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道,这里采用单声道
    [dict setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数,分为8、16、24、32
    [dict setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dict setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    //....其他设置等
    return dict;
}

- (IBAction)starRecordAction:(id)sender {
    
    //方式三,无弹框提示
//    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel://%@",@"10086"];
////    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt:%@",@"10086"];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];
}
- (IBAction)stopRecordAction:(id)sender {
//    [self.recorder stop];
}
@end
