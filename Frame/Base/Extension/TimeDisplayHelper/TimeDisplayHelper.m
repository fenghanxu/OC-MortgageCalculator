//
//  TimeDisplayHelper.m
//  Frame
//
//  Created by 冯汉栩 on 2025/3/31.
//

#import "TimeDisplayHelper.h"

@implementation TimeDisplayHelper

+ (NSString *)wechatStyleTimeStringFromDate:(NSDate *)date {
    if (!date) return @"";
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 计算时间差（秒）
    NSTimeInterval interval = [now timeIntervalSinceDate:date];
    
    // 今天的时间显示
    if ([calendar isDateInToday:date]) {
        if (interval < 60) {
            return @"刚刚";
        } else if (interval < 60 * 60) {
            return [NSString stringWithFormat:@"%d分钟前", (int)(interval/60)];
        } else {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"HH:mm";
            return [formatter stringFromDate:date];
        }
    }
    
    // 昨天的时间显示
    if ([calendar isDateInYesterday:date]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"昨天 HH:mm";
        return [formatter stringFromDate:date];
    }
    
    // 本周内的时间显示（周一、周二...）
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekOfYear fromDate:date toDate:now options:0];
    if (components.weekOfYear == 0) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        // 设置本地化为中文
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        
        // 使用自定义的星期几格式
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSInteger weekday = [cal component:NSCalendarUnitWeekday fromDate:date];
        
        // 星期几的中文简称（周日到周六）
        NSArray *weekdaySymbols = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
        NSString *weekdayString = weekdaySymbols[weekday-1]; // weekday从1开始
        
        // 获取时间部分
        formatter.dateFormat = @"HH:mm";
        NSString *timeString = [formatter stringFromDate:date];
        
        return [NSString stringWithFormat:@"%@ %@", weekdayString, timeString];
    }
    
    // 今年的显示（月-日 时:分）
    components = [calendar components:NSCalendarUnitYear fromDate:date toDate:now options:0];
    if (components.year == 0) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM-dd HH:mm";
        return [formatter stringFromDate:date];
    }
    
    // 更早的时间（年-月-日 时:分）
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    return [formatter stringFromDate:date];
}

@end
