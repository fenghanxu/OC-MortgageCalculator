//
//  CameraManager.h
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/9.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CameraResultBlock)(UIImage *image, NSError *error);

@interface CameraManager : NSObject

// 单例模式
+ (instancetype)sharedManager;

/**
 打开相机拍照并返回图片
 
 @param viewController 用于呈现相机界面的视图控制器
 @param resultBlock 拍照结果回调 (主线程)
 */
- (void)takePhotoWithViewController:(UIViewController *)viewController
                        resultBlock:(CameraResultBlock)resultBlock;

@end
