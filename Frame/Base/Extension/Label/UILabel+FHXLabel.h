//
//  UILabel+FHXLabel.h
//  ShoppingMall
//
//  Created by 冯汉栩 on 2019/11/7.
//  Copyright © 2019 fenghanxu.compang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (FHXLabel)

@property (assign, nonatomic) UIEdgeInsets edgeInsets;

// 设置label行间距
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

// 竖排写
@property (nonatomic) NSString *verticalText;

// 流式布局
- (void)streamingAssignment:(NSString *)value withInterval:(NSTimeInterval)interval lineSpacing:(CGFloat)lineSpacing;
@end

NS_ASSUME_NONNULL_END
