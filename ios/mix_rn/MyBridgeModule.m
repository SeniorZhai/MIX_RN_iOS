//
//  MyBridgeModule.m
//  mix_rn
//
//  Created by zhai on 2018/5/11.
//  Copyright © 2018年 zhai. All rights reserved.
//

#import "MyBridgeModule.h"

@implementation MyBridgeModule
RCT_EXPORT_MODULE();

// RN call ios
RCT_EXPORT_METHOD(addEventOne:(NSString *) name) {
    NSLog(@"接受到消息：%@",name);
}

RCT_EXPORT_METHOD(addEventTwo:(NSString *)string data:(NSDate *) date) {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    RCTLogInfo(@"接收传过来的NSString+NSDictionary: %@ %@", string, [formatter stringFromDate:date]);
}

RCT_EXPORT_METHOD(callBackOne:(NSString *)string callback:(RCTResponseSenderBlock)callback) {
    NSLog(@"接受到：%@",string);
    NSArray *events=@[@"1", @"2", @"3",@"4"]; //准备回调回去的数据
    callback(@[[NSNull null],events]);
}

RCT_REMAP_METHOD(callPromise,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    NSArray *events =@[@"one ",@"two ",@"three"];//准备回调回去的数据
    if (events) {
        resolve(events);
    } else {
        NSError *error=[NSError errorWithDomain:@"我是Promise回调错误信息..." code:101 userInfo:nil];
        reject(@"no_events", @"There were no events", error);
    }
}

- (NSDictionary *)constantsToExport
{
    return @{ @"constants": @"常量 version 0.0.1" };
}


@end
