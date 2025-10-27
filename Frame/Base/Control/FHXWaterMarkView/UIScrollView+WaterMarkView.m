//
//  UIScrollView+WaterMarkView.m
//  ShoppingMall
//
//  Created by 冯汉栩 on 2020/9/24.
//  Copyright © 2020 fenghanxu.compang.cn. All rights reserved.
//

#import "UIScrollView+WaterMarkView.h"
#import <objc/runtime.h>

@implementation UIScrollView (WaterMarkView)

- (void)setWaterMarkHidden:(BOOL)waterMarkHidden{
//  if (waterMarkHidden) { [FHXWaterMarkView waterMarkViewWithText:[LoginUserInfo new].mobile_no]; }
  objc_setAssociatedObject(self, @"kWaterMarkHidden", @(waterMarkHidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)waterMarkHidden{
  return [objc_getAssociatedObject(self, @"kWaterMarkHidden") boolValue];

}

@end
