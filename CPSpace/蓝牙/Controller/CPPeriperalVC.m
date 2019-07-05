//
//  CPPeriperalVC.m
//  CPSpace
//
//  Created by 王璋传 on 2019/7/2.
//  Copyright © 2019 王璋传. All rights reserved.
//

#import "CPPeriperalVC.h"
#import <CoreBluetooth/CoreBluetooth.h>

//#define SERVICE_ID  (@"CP_TEST_BLE_SERVICE_ID")
//#define CHARACTERISTIC_ID  (@"CP_TEST_BLE_CHARACTERISTIC_ID")

#define SERVICE_ID  @"CDD1"
#define CHARACTERISTIC_ID  @"CDD2"

@interface CPPeriperalVC ()<CBPeripheralDelegate, CBPeripheralManagerDelegate>

@property (nonatomic, strong) CBPeripheralManager     * peripheralManager;
@property (nonatomic, strong) CBMutableCharacteristic * characteristic;

@end

@implementation CPPeriperalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initailizeBaseProperties];
}

#pragma mark - Initialized properties
- (void)initailizeBaseProperties {
    self.title = @"主机";
    
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];

}
#pragma mark - setter && getter method
#pragma mark - Setup UI
- (void)setupUI {
    
}
#pragma mark - Delegate && dataSource method implement

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - CBPeripheralManagerDelegate
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    
    if (@available(iOS 10.0, *)) {
        if (CBManagerStatePoweredOn == peripheral.state) {
            NSLog(@"蓝牙已经准备好");
            [self setupService];
            [self.peripheralManager startAdvertising:@{CBAdvertisementDataLocalNameKey : @"CP_TEST_BLE", CBAdvertisementDataServiceUUIDsKey: @[cp_getUUIDBy(SERVICE_ID)]}];
        } else {
            NSLog(@"蓝牙未打开");
        }
    } else {
        // Fallback on earlier versions
    }
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveReadRequest:(CBATTRequest *)request {
    NSString *str = [[NSString alloc] initWithData:request.value encoding:NSUTF8StringEncoding];
    NSLog(@"读出:%@", str);
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveWriteRequests:(NSArray<CBATTRequest *> *)requests {
    NSString *str = [[NSString alloc] initWithData:requests.lastObject.value encoding:NSUTF8StringEncoding];
    
    NSLog(@"写入: %@",str);
    
    self.inputTF.text = str;
}

/** 订阅成功回调 */
-(void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didSubscribeToCharacteristic:(CBCharacteristic *)characteristic {
    NSLog(@"%s",__FUNCTION__);
}

/** 取消订阅回调 */
-(void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didUnsubscribeFromCharacteristic:(CBCharacteristic *)characteristic {
    NSLog(@"%s",__FUNCTION__);
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
CBUUID *cp_getUUIDBy(NSString *uuid) {
    return [CBUUID UUIDWithString:uuid];
}

- (void)setupService {
    
    CBMutableService *service = [[CBMutableService alloc] initWithType:cp_getUUIDBy(SERVICE_ID) primary:YES];
    CBMutableCharacteristic *characteristic = [[CBMutableCharacteristic alloc] initWithType:cp_getUUIDBy(CHARACTERISTIC_ID) properties:CBCharacteristicPropertyRead | CBCharacteristicPropertyWrite | CBCharacteristicPropertyNotify value:nil permissions:CBAttributePermissionsReadable | CBAttributePermissionsWriteable ];
    service.characteristics = @[characteristic];
    
    [self.peripheralManager addService:service];
    
    self.characteristic = characteristic;
}

- (void)setupCharacteristic {
    
}

- (IBAction)sendMessage:(id)sender {
    
    BOOL ret = [self.peripheralManager updateValue:[self.inputTF.text dataUsingEncoding:NSUTF8StringEncoding] forCharacteristic:self.characteristic onSubscribedCentrals:nil];
    
    if (YES == ret) {
        NSLog(@"✅");
    } else {
        NSLog(@"❌");
    }
}
@end
