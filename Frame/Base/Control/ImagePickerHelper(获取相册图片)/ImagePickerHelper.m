//
//  ImagePickerHelper.m
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/8.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import "ImagePickerHelper.h"
#import <Photos/Photos.h>

@interface ImagePickerHelper () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) ImagePickerCompletion completionBlock;
@property (nonatomic, weak) UIViewController *presentingViewController;

@end

@implementation ImagePickerHelper

+ (void)imagePickerSingleImageFromAlbumWithViewController:(UIViewController *)viewController
                                          completion:(ImagePickerCompletion)completion {
    // 检查权限
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        // 无权限
        NSError *error = [NSError errorWithDomain:@"com.yourapp.imagepicker"
                                             code:403
                                         userInfo:@{NSLocalizedDescriptionKey: @"无相册访问权限，请前往设置开启"}];
        completion(nil, error);
        return;
    }
    
    // 创建实例并保存block
    ImagePickerHelper *helper = [[ImagePickerHelper alloc] init];
    helper.completionBlock = completion;
    helper.presentingViewController = viewController;
    
    // 防止helper被提前释放
    objc_setAssociatedObject(viewController, "ImagePickerHelper", helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 检查权限，如果未决定则请求权限
    if (status == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusAuthorized) {
                    [helper presentImagePicker];
                } else {
                    NSError *error = [NSError errorWithDomain:@"com.yourapp.imagepicker"
                                                         code:403
                                                     userInfo:@{NSLocalizedDescriptionKey: @"用户拒绝了相册访问权限"}];
                    completion(nil, error);
                }
            });
        }];
    } else {
        [helper presentImagePicker];
    }
}

- (void)presentImagePicker {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        NSError *error = [NSError errorWithDomain:@"com.yourapp.imagepicker"
                                             code:404
                                         userInfo:@{NSLocalizedDescriptionKey: @"设备不支持相册功能"}];
        self.completionBlock(nil, error);
        return;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    picker.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self.presentingViewController presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        if (selectedImage) {
            self.completionBlock(selectedImage, nil);
        } else {
            NSError *error = [NSError errorWithDomain:@"com.yourapp.imagepicker"
                                                 code:500
                                             userInfo:@{NSLocalizedDescriptionKey: @"未能获取选择的图片"}];
            self.completionBlock(nil, error);
        }
        
        // 释放helper
        objc_setAssociatedObject(self.presentingViewController, "ImagePickerHelper", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
        NSError *error = [NSError errorWithDomain:@"com.yourapp.imagepicker"
                                             code:499
                                         userInfo:@{NSLocalizedDescriptionKey: @"用户取消了选择"}];
        self.completionBlock(nil, error);
        
        // 释放helper
        objc_setAssociatedObject(self.presentingViewController, "ImagePickerHelper", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
}

@end
