//
//  LocationManager.h
//  Frame
//
//  Created by sdebank on 2021/8/27.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocationManager.h>
NS_ASSUME_NONNULL_BEGIN

@interface LocationManager : NSObject

/*
 * 判断是否打开定位
 */
 
+ (BOOL)determineWhetherTheAPPOpensTheLocation;

@end

NS_ASSUME_NONNULL_END
