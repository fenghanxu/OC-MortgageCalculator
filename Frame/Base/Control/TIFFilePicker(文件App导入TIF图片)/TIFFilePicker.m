//
//  TIFFilePicker.m
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/8.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import "TIFFilePicker.h"
#import <UniformTypeIdentifiers/UniformTypeIdentifiers.h> // 需要导入 UTType

@implementation TIFFilePicker {
    void(^_completion)(NSData *, NSString *, NSError *);
    TIFFilePicker *_selfRetain;
}

+ (void)tifFilePickerFrom:(UIViewController *)vc completion:(void(^)(NSData *, NSString *, NSError *))completion {
    TIFFilePicker *picker = [[TIFFilePicker alloc] init];
    picker->_completion = completion;
    picker->_selfRetain = picker;

    // iOS 14+ 推荐方式：使用 UTType 代替旧的 UTI 字符串
    if (@available(iOS 14.0, *)) {
        // 允许所有文件类型
        NSArray<UTType *> *contentTypes = @[UTTypeItem]; // UTTypeItem 表示所有文件
        UIDocumentPickerViewController *dpvc = [[UIDocumentPickerViewController alloc] initForOpeningContentTypes:contentTypes];
        dpvc.delegate = picker;
        [vc presentViewController:dpvc animated:YES completion:nil];
    } else {
        // 兼容 iOS 14 以下版本（已弃用）
        UIDocumentPickerViewController *dpvc = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.item"] inMode:UIDocumentPickerModeOpen];
        dpvc.delegate = picker;
        [vc presentViewController:dpvc animated:YES completion:nil];
    }
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
    NSURL *url = urls.firstObject;
    if (![url startAccessingSecurityScopedResource]) {
        [self finish:nil name:nil error:@"无法访问所选文件"];
        return;
    }

    NSData *data = [NSData dataWithContentsOfURL:url];
    [url stopAccessingSecurityScopedResource];

    if (!data) {
        [self finish:nil name:nil error:@"无法读取数据"];
    } else {
        [self finish:data name:url.lastPathComponent error:nil];
    }
}

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    [self finish:nil name:nil error:@"用户取消"];
}

- (void)finish:(NSData *)data name:(NSString *)name error:(NSString *)errMsg {
    if (_completion) {
        _completion(data, name, errMsg ? [NSError errorWithDomain:@"com.tifpicker" code:-1 userInfo:@{NSLocalizedDescriptionKey: errMsg}] : nil);
    }
    _completion = nil;
    _selfRetain = nil;
}

@end

