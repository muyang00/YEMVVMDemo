//
//  NSString+Common.m
//  Coding_iOS
//
//  Created by 王 原闯 on 14-7-31.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "NSString+Common.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"


@implementation NSString (Common)


- (NSString *)md5Str
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; 
}

+ (BOOL)isPhoneNumber:(NSString *)str
{
    NSString * CT = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]|170))\\d{8}$";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    return [regextestct evaluateWithObject:str];
    
}

+ (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize size = CGSizeMake(width, 20000.0f);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontSize], NSFontAttributeName,nil];
    
    size =[value boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size.height;
    
    
}
+ (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    CGSize size = CGSizeMake(2000.f, height);//注：这个高：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontSize], NSFontAttributeName,nil];
    
    size =[value boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size.width;
}
//判断id类型的数据为不为空
+ (BOOL)isNotNull:(id)object
{
    // 对应返回的数组   "data":,
    if (object) {
        // 有值就继续向下判断
    }else{
        return 0;
    }
    
    if (object == nil) {
        return 0;
    }
    
    if ([object isKindOfClass:[NSNull class]]) {
        return 0;
    }
    if ([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@""]) {
            return 0;
        }
        if ([object length] == 0 ) {
            return 0;
        }
    }
    // 对应返回的数组   "data":[]
    if ([object isKindOfClass:[NSArray class]]) {
        if ([object isEqualToArray:@[]]) {
            return 0;
        }
    }
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        if ([object isEqualToDictionary:@{}]) {
            return 0;
        }
    }
    if ([object isKindOfClass:[NSNumber class]]) {
        
        if ([object isEqualToNumber:[NSNumber numberWithInteger:0]]) {
            return 0;
        }
    }
    
    return 1;
}

// json化dictionary
+ (NSString*)JSONWithDictionary:(NSDictionary*)dict
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error) {
        return @"";
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    // 把回车和空格去除
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return jsonString;
}
//时间戳转时间
+(NSString *)conversionTimestampToData:(NSString *)timeString
{
    int time = [timeString intValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yy-MM-dd HH:mm"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    
    return confromTimespStr;
}
//判断是否为整形
- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形
- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:font constrainedToSize:size].height;
}
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:font constrainedToSize:size].width;
}
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    CGSize resultSize = CGSizeZero;
    if (self.length <= 0) {
        return resultSize;
    }
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        resultSize = [self boundingRectWithSize:size
                                        options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                     attributes:@{NSFontAttributeName: font}
                                        context:nil].size;
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        resultSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        
        
#endif
    }
    resultSize = CGSizeMake(MIN(size.width, ceilf(resultSize.width)), MIN(size.height, ceilf(resultSize.height)));
    
    return resultSize;
}
+(id)stringDisplay_MMddee:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.S"];
    NSDate *date = [formatter dateFromString:dateString];
    
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval cellTime = [date timeIntervalSince1970];
    NSDateFormatter *formatter1 = [NSDateFormatter new];
    if (currentTime - cellTime > 86400) {
        [formatter1 setDateFormat:@"yyyy-MM-dd"];
    } else {
    [formatter1 setDateFormat:@"HH:mm"];
    }
    return [formatter1 stringFromDate:date];
}
@end
