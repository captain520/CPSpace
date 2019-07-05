//
//  CPCentralVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/7/2.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPCentralVC.h"
#import <CoreBluetooth/CoreBluetooth.h>

#define SERVICE_UUID        @"CDD1"
#define CHARACTERISTIC_UUID @"CDD2"

@interface CPCentralVC ()<CBCentralManagerDelegate,CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager * manager;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, strong) CBCharacteristic *characteristic;

@property (nonatomic, strong) NSMutableAttributedString * contentAttr;

@end

@implementation CPCentralVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initailizeBaseProperties];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.title = @"从机";
    
    self.contentAttr = [[NSMutableAttributedString alloc] init];
    self.conentTF.layoutManager.allowsNonContiguousLayout = NO;

    self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
    //  未打开会自动弹框提示去“设置”里面打开蓝牙
    if (@available(iOS 10.0, *)) {
        if (CBManagerStatePoweredOn ==  central.state) {
            NSLog(@"蓝牙已经打开");
            
            //  2. 扫描蓝牙外设 -- 这里只搜索需要的
            [central scanForPeripheralsWithServices:@[cp_getUUID(SERVICE_UUID)] options:nil];
            
        } else {
            NSLog(@"蓝牙异常");
        }
    } else {
        // Fallback on earlier versions
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    
    //  发射name可能为空
    
    self.peripheral = peripheral;
    NSLog(@"----------:%@",peripheral.name);
    //  3. 连接搜索到需要的外设
    [central connectPeripheral:peripheral options:nil];
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
    // 4.1 连接成功后停止继续扫描, 防止再去连接
    [central stopScan];
    
    // 4.2 连接后进行服务查找
    peripheral.delegate = self;
    [peripheral discoverServices:@[cp_getUUID(SERVICE_UUID)]];
}

-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"连接失败");
    
    // 连接失败可以设置重新连接或提示
    NSLog(@"%@",error.localizedDescription);
    //    [central connectPeripheral:peripheral options:nil];
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    
    NSLog(@"断开连接: %@",error.localizedDescription);
    
    // 断开连接可以设置重新连接
    [central connectPeripheral:peripheral options:nil];
}

#pragma mark - CBPeripheralDelegate
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    } else {
        for (CBService *item in peripheral.services) {
            NSLog(@"%@",item);
            
            //  5.进行对应服务的特征查找
            if ([item.UUID.UUIDString isEqualToString:SERVICE_UUID]) {
                [peripheral discoverCharacteristics:@[cp_getUUID(CHARACTERISTIC_UUID)] forService:item];
            }
        }
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    
    // 遍历出所需要的特征
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([characteristic.UUID.UUIDString isEqualToString:CHARACTERISTIC_UUID]) {
            
            self.characteristic = characteristic;
            
            [peripheral readValueForCharacteristic:characteristic];
            // 6. 订阅通知
            [peripheral setNotifyValue:YES forCharacteristic:characteristic];
        }
    }
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    
    if (characteristic.isNotifying) {
        NSLog(@"订阅成功");
    } else {
        NSLog(@"取消订阅");
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    // 拿到外设发送过来的数据
    NSData *data = characteristic.value;
    NSLog(@"收到：%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *contentStr = [NSString stringWithFormat:@"收到：%@\n",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];

    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:contentStr attributes:@{NSForegroundColorAttributeName : UIColor.yellowColor}];
    
    [self.contentAttr appendAttributedString:attr];
    
    self.conentTF.attributedText = self.contentAttr;
    [self.conentTF scrollRangeToVisible:NSMakeRange(self.contentAttr.length, 1)];
    
}

/** 写入数据回调 */
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(nonnull CBCharacteristic *)characteristic error:(nullable NSError *)error {
    NSData *data = characteristic.value;
    NSLog(@"写入：%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString *contentStr = [NSString stringWithFormat:@"写入：%@\n",self.inputTF.text/*[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]*/];
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:contentStr attributes:@{NSForegroundColorAttributeName : UIColor.greenColor}];
    
    [self.contentAttr appendAttributedString:attr];
    
    self.conentTF.attributedText = self.contentAttr;
    [self.conentTF scrollRangeToVisible:NSMakeRange(self.contentAttr.length, 1)];
    
}
#pragma mark - load data
- (void)loadData {
    
}
- (void)handleLoadDataBlock:(NSArray *)results {
}

#pragma mark - Private method implement

/**
 将字符串转为CBUUID
 
 @param uuid 将要转换的字符串
 @return  CBUUID
 */
CBUUID *cp_getUUID(NSString *uuid) {
    return [CBUUID UUIDWithString:uuid];
}

- (IBAction)sendMessage:(id)sender {
    
    [self.view endEditing:YES];
    
    if (self.inputTF.text.length > 0) {
        NSData *data = [self.inputTF.text dataUsingEncoding:NSUTF8StringEncoding];
        
        [self.peripheral writeValue:data forCharacteristic:self.characteristic type:CBCharacteristicWriteWithResponse];
    } else {
        [self.view makeToast:@"数据不能为空" duration:2.0f position:CSToastPositionCenter];
    }
    
}

@end
