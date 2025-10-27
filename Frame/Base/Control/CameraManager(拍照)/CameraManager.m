//
//  CameraManager.m
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/9.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import "CameraManager.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraManager () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, copy) CameraResultBlock resultBlock;
@property (nonatomic, weak) UIViewController *presentingViewController;

@end

@implementation CameraManager

+ (instancetype)sharedManager {
    static CameraManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CameraManager alloc] init];
    });
    return instance;
}

- (void)takePhotoWithViewController:(UIViewController *)viewController
                        resultBlock:(CameraResultBlock)resultBlock {
    self.resultBlock = resultBlock;
    self.presentingViewController = viewController;
    
    // 检查相机是否可用
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSError *error = [NSError errorWithDomain:@"com.yourdomain.camera"
                                             code:1001
                                         userInfo:@{NSLocalizedDescriptionKey: @"设备没有摄像头或摄像头不可用"}];
        [self returnResult:nil error:error];
        return;
    }
    
    // 检查相机权限
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        NSError *error = [NSError errorWithDomain:@"com.yourdomain.camera"
                                             code:1002
                                         userInfo:@{NSLocalizedDescriptionKey: @"相机访问被拒绝。请在设置中启用相机访问权限。"}];
        [self returnResult:nil error:error];
        return;
    }
    
    // 创建并配置图像选择器
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;
    picker.allowsEditing = NO; // 设置为YES可以允许编辑图片
    
    // 设置导航栏标题和按钮文字为中文
    picker.navigationBar.topItem.title = @"拍照";
    if (@available(iOS 13.0, *)) {
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:nil action:nil];
        picker.navigationBar.topItem.leftBarButtonItem = cancelButton;
    }
    
    // 呈现相机界面
    [viewController presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
    // 获取原始图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // 关闭相机界面
    [picker dismissViewControllerAnimated:YES completion:^{
        [self returnResult:image error:nil];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
        NSError *error = [NSError errorWithDomain:@"com.yourdomain.camera"
                                             code:1003
                                         userInfo:@{NSLocalizedDescriptionKey: @"用户取消了拍照"}];
        [self returnResult:nil error:error];
    }];
}

#pragma mark - Private Methods

- (void)returnResult:(UIImage *)image error:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.resultBlock) {
            self.resultBlock(image, error);
        }
        // 清理block和引用
        self.resultBlock = nil;
        self.presentingViewController = nil;
    });
}

@end
