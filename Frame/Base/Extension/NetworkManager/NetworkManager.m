//
//  NetworkManager.m
//  Frame
//
//  Created by 冯汉栩 on 2025/2/24.
//

#import "NetworkManager.h"
#import <SystemConfiguration/SystemConfiguration.h>

@interface NetworkManager ()
@property (nonatomic, assign) SCNetworkReachabilityRef reachabilityRef;
@property (nonatomic, assign) NetworkType lastNetworkType; // 用于保存上次的网络类型
@property (nonatomic, assign) BOOL isFirst;
@end

@implementation NetworkManager

+ (instancetype)sharedManager {
    static NetworkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetworkManager alloc] init];
        manager.isFirst = YES;
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        // 创建一个 Reachability 对象来监测网络连接
        struct sockaddr_in zeroAddress;
        bzero(&zeroAddress, sizeof(zeroAddress));
        zeroAddress.sin_len = sizeof(zeroAddress);
        zeroAddress.sin_family = AF_INET;

        self.reachabilityRef = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    }
    return self;
}

- (void)startMonitoring {
    if (self.reachabilityRef) {
        SCNetworkReachabilityContext context = {0, (__bridge void *)(self), NULL, NULL, NULL};
        SCNetworkReachabilitySetCallback(self.reachabilityRef, reachabilityCallback, &context);
        SCNetworkReachabilitySetDispatchQueue(self.reachabilityRef, dispatch_get_main_queue());
    }
    
    //这段代码的目前是为了跟上一次网络进行比较用的，第一次启动，把当前状态赋值给上一个的状态。使得第一次发生改变就可以发出通知
    if (self.isFirst) {
        self.isFirst = NO;
        SCNetworkReachabilityFlags flags;
        if (SCNetworkReachabilityGetFlags(self.reachabilityRef, &flags)) {
            if ((flags & kSCNetworkReachabilityFlagsReachable) == 0) {
                self.lastNetworkType = NetworkTypeNone;  // 无网络
            } else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
                self.lastNetworkType = NetworkTypeCellular;  // 移动网络
            } else {
                self.lastNetworkType = NetworkTypeWiFi;  // Wi-Fi 网络
            }
        }
    }

}

- (void)stopMonitoring {
    if (self.reachabilityRef) {
        SCNetworkReachabilitySetDispatchQueue(self.reachabilityRef, NULL);
    }
}

// 获取网络状态
- (NetworkType)currentNetworkType {
    NetworkType networkType = NetworkTypeNone;
    SCNetworkReachabilityFlags flags;
    
    if (SCNetworkReachabilityGetFlags(self.reachabilityRef, &flags)) {
        if ((flags & kSCNetworkReachabilityFlagsReachable) == 0) {
            networkType = NetworkTypeNone;  // 无网络
        } else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
            networkType = NetworkTypeCellular;  // 移动网络
        } else {
            networkType = NetworkTypeWiFi;  // Wi-Fi 网络
        }
    }
    return networkType;
}

// 判断设备是否已经连接到网络
- (BOOL)isNetworkReachable {
    SCNetworkReachabilityFlags flags;
    if (SCNetworkReachabilityGetFlags(self.reachabilityRef, &flags)) {
        return (flags & kSCNetworkReachabilityFlagsReachable) != 0;
    }
    return NO;
}

// 回调函数，用于处理网络状态变化
static void reachabilityCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags flags, void *info) {
    NetworkManager *manager = (__bridge NetworkManager *)(info);
    if (manager) {
        NetworkType networkType = NetworkTypeNone;
        if ((flags & kSCNetworkReachabilityFlagsReachable) == 0) {
            networkType = NetworkTypeNone;
        } else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
            networkType = NetworkTypeCellular;
        } else {
            networkType = NetworkTypeWiFi;
        }

        //通知网络发生变化
        NSDictionary *dict = @{@"type": @(networkType)};
        NSNotification *notification =[NSNotification notificationWithName:@"NetworkChangedNotification" object:nil userInfo:dict];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
        // 如果当前网络状态与上次不同，则发送通知
        if (networkType != manager.lastNetworkType) {
            // 根据不同的网络状态发送通知
            int trendType = 0;
            if (networkType == NetworkTypeNone) {
                if (manager.lastNetworkType == NetworkTypeWiFi) {
                    trendType = 1;  // WiFi 变为无网络
                }
            } else if (networkType == NetworkTypeWiFi) {
                if (manager.lastNetworkType == NetworkTypeCellular) {
                    trendType = 2;  // 移动网络变为 Wi-Fi
                }
            } else if (networkType == NetworkTypeCellular) {
                if (manager.lastNetworkType == NetworkTypeWiFi) {
                    trendType = 3;  // Wi-Fi 变为移动网络
                }
            }
            
            // 发送网络状态变化通知
            NSDictionary *userInfo = @{@"type": @(trendType)};
            NSNotification *notification = [NSNotification notificationWithName:@"NetworkTrendNotification" object:nil userInfo:userInfo];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            
            // 更新上次的网络状态
            manager.lastNetworkType = networkType;
        }
        
    }
}

@end
