//
//  ImagePickerHelper.h
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/8.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ImagePickerCompletion)(UIImage * _Nullable selectedImage, NSError * _Nullable error);

@interface ImagePickerHelper : NSObject

/**
 从相册选择单张图片

 @param viewController 用于呈现 UIImagePickerController 的视图控制器
 @param completion 选择完成后的回调，返回选择的图片或错误信息
 */
+ (void)imagePickerSingleImageFromAlbumWithViewController:(UIViewController *)viewController
                                          completion:(ImagePickerCompletion)completion;

@end

NS_ASSUME_NONNULL_END
