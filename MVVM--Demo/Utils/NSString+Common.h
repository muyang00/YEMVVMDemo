//
//  NSString+Common.h
//  Coding_iOS
//
//  Created by
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Common)

+(NSString *)conversionTimestampToData:(NSString *)timeString;

//string的高度
+ (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;

/**
 *  获取字符串宽度
 */
+ (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;

//判断id类型的数据为不为空
+ (BOOL)isNotNull:(id)object;

/**
 *  md5加密
 *
 */
- (NSString *)md5Str;
+ (NSString*)JSONWithDictionary:(NSDictionary*)dict;

//判断是否为整形
- (BOOL)isPureInt;
//判断是否为浮点形
- (BOOL)isPureFloat;

/**
 *  判断是不是手机号
 */
+ (BOOL)isPhoneNumber:(NSString *)str;

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
+(id)stringDisplay_MMddee:(NSString *)dateString;

@end
