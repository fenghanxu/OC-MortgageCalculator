//
//  LocationManager.m
//  Frame
//
//  Created by sdebank on 2021/8/27.
//

#import "LocationManager.h"

@implementation LocationManager

#pragma mark 判断是否打开定位
+(BOOL)determineWhetherTheAPPOpensTheLocation{
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] ==kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] ==kCLAuthorizationStatusAuthorized)) {
        return YES;
    } else if ( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ) {
        return NO;
    } else {
        return NO;
    }
}

@end
