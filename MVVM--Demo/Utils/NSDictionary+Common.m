//
//  NSDictionary+Common.m
//  SXTV
//
//  Created by Apple on 16/1/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "NSDictionary+Common.h"

@implementation NSDictionary(Common)

+ (NSDictionary *)DictionaryWithJSON:(id)responseObject
{
    NSData *jsonData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
