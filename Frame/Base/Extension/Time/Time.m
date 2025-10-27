//
//  Time.m
//  OCDemol
//
//  Created by 冯汉栩 on 2019/3/11.
//  Copyright © 2019年 com.fenghanxu.demol. All rights reserved.
//

#import "Time.h"

@implementation Time

/**
 *  获取当前的时间
 *
 *  @param type  时间格式(YYYY-MM-dd hh:mm:ss SSS)  (YYYY-MM-dd)  (MM-dd) (hh:mm:ss SSS) (hhmmssSSS)
 *
 *  @return  时间字符串
 */
+(NSString*)getCurrentTimesWithType:(NSString *)type{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:type];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    return [formatter stringFromDate:datenow];
}

//获取当前时间戳有两种方法(以秒为单位)
//获取当前时间的时间戳(秒)  方法1
+(NSString *)getNowTimeTimestampaSecondA{
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
}

//获取当前时间的时间戳(秒)  方法2
+(NSString *)getNowTimeTimestampSecondB{
  NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
  NSTimeInterval a=[dat timeIntervalSince1970];
  NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
  return timeString;
}

//获取当前时间戳  （以毫秒为单位）
+(NSString *)getNowTimeTimestampMillisecond{
  return [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]*1000];
}



@end
