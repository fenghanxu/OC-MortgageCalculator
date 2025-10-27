//
//  Time.h
//  OCDemol
//
//  Created by 冯汉栩 on 2019/3/11.
//  Copyright © 2019年 com.fenghanxu.demol. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Time : NSString

/**
 *  获取当前的时间
 *
 *  @param type  时间格式(YYYY-MM-dd hh:mm:ss SSS)  (YYYY-MM-dd)  (MM-dd) (hh:mm:ss SSS) (hhmmssSSS)
 *
 *  @return  时间字符串
 */
+(NSString*)getCurrentTimesWithType:(NSString *)type;

//获取当前时间的时间戳(秒)  方法1
+(NSString *)getNowTimeTimestampaSecondA;

//获取当前时间的时间戳(秒)  方法2
+(NSString *)getNowTimeTimestampSecondB;

//获取当前时间戳  （以毫秒为单位）
+(NSString *)getNowTimeTimestampMillisecond;


@end

NS_ASSUME_NONNULL_END


