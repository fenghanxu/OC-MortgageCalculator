//
//  NetworkManager.h
//  Frame
//
//  Created by 冯汉栩 on 2025/2/24.
//

#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NetworkType) {
    NetworkTypeNone,     // 无网络
    NetworkTypeWiFi,     // Wi-Fi 网络
    NetworkTypeCellular  // 移动网络
};

@interface NetworkManager : NSObject

+ (instancetype)sharedManager;

//开始监听网络
- (void)startMonitoring;

//停止监听网络
- (void)stopMonitoring;

// 获取网络状态
- (NetworkType)currentNetworkType;

// 判断设备是否已经连接到网络
- (BOOL)isNetworkReachable;


@end

NS_ASSUME_NONNULL_END
