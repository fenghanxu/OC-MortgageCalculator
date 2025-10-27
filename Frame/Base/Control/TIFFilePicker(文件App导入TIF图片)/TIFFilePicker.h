//
//  TIFFilePicker.h
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/8.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TIFFilePicker : NSObject <UIDocumentPickerDelegate>

+ (void)tifFilePickerFrom:(UIViewController *)viewController
             completion:(void(^)(NSData * _Nullable fileData, NSString * _Nullable fileName, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
