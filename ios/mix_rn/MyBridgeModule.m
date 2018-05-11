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

@end
