//
//  UILabel+FHXLabel.m
//  ShoppingMall
//
//  Created by 冯汉栩 on 2019/11/7.
//  Copyright © 2019 fenghanxu.compang.cn. All rights reserved.
//

#import "UILabel+FHXLabel.h"

@implementation UILabel (FHXLabel)

// 设置label行间距
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
  
  if (lineSpacing < 0.01 || !text) {
    self.text = text;
    return;
  }
  
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
  [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
  
  NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
  [paragraphStyle setLineSpacing:lineSpacing];
  [paragraphStyle setLineBreakMode:self.lineBreakMode];
  [paragraphStyle setAlignment:self.textAlignment];
  [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
  
  self.attributedText = attributedString;
}


// 竖排写(getter)
- (NSString *)verticalText{
    // 利用runtime添加属性
    return objc_getAssociatedObject(self, @selector(verticalText));
}

// 竖排写(setter)
- (void)setVerticalText:(NSString *)verticalText{
    objc_setAssociatedObject(self, &verticalText, verticalText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSMutableString *str = [[NSMutableString alloc] initWithString:verticalText];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2-1];
    }
    self.text = str;
    self.numberOfLines = 0;
}

//流式布局
- (void)streamingAssignment:(NSString *)value
              withInterval:(NSTimeInterval)interval
               lineSpacing:(CGFloat)lineSpacing {
    // 清空当前文本
    self.attributedText = [[NSAttributedString alloc] initWithString:@""];
    
    // 创建段落样式并设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    // 创建属性字典
    NSDictionary *attributes = @{
        NSFontAttributeName: self.font,
        NSParagraphStyleAttributeName: paragraphStyle
    };
    
    // 将字符串拆分为字符数组
    NSMutableArray *responseChunks = [NSMutableArray new];
    for (NSInteger i = 0; i < value.length; i++) {
        [responseChunks addObject:[value substringWithRange:NSMakeRange(i, 1)]];
    }
    
    // 使用定时器逐字显示
    __block NSInteger index = 0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (index < responseChunks.count) {
            // 获取当前文本
            NSMutableAttributedString *currentText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
            
            // 添加新字符
            NSAttributedString *newChar = [[NSAttributedString alloc] initWithString:responseChunks[index] attributes:attributes];
            [currentText appendAttributedString:newChar];
            
            // 更新显示
            self.attributedText = currentText;
            index++;
        } else {
            [timer invalidate];
        }
    }];
    
    // 启动定时器
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

@end
