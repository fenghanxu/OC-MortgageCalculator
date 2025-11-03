//
//  DelectedPopupView.h
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/7.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DelectedPopupViewBlock) (NSString* value);

@interface DelectedPopupView : UIView

+(void)showWithTestActionWindow:(UIWindow *)window WithBlock:(DelectedPopupViewBlock)block;

@end

NS_ASSUME_NONNULL_END
