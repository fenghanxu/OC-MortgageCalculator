//
//  Color.m
//  ShoppingMall
//
//  Created by 冯汉栩 on 2019/3/23.
//  Copyright © 2019年 fenghanxu.compang.cn. All rights reserved.
//

#import "Color.h"
#import "UIColor+Hex.h"

@implementation Color

+ (UIColor *)randomColor{
  return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

+ (UIColor *)theme{
  return [UIColor colorWithHexString:@"#3CB371"];
}

+ (UIColor *)themeLight{
  return [UIColor colorWithHexString:@"#7FFFAA"];
}

+ (UIColor *)themeShallow{
  return [UIColor colorWithHexString:@"#CFFFDD"];
}

+ (UIColor *)themeWeak{
  return [UIColor colorWithHexString:@"#EBFFF5"];
}

+ (UIColor *)textBlank{
  return [UIColor colorWithHexString:@"#333333"];
}

+ (UIColor *)textSub{
  return [UIColor colorWithHexString:@"#8c8c8c"];
}

+ (UIColor *)nonActivated{
  return [UIColor colorWithHexString:@"#bebebe"];
}

+ (UIColor *)textLine{
  return [UIColor colorWithHexString:@"#dddddd"];
}

+ (UIColor *)line{
  return [UIColor colorWithHexString:@"#e5e5e5"];
}

+ (UIColor *)backgroung{
  return [UIColor colorWithHexString:@"#F5F5F5"];
}

+ (UIColor *)assist{
  return [UIColor colorWithHexString:@"#ffac03"];
}

+ (UIColor *)assistDeep{
  return [UIColor colorWithHexString:@"#f4a400"];
}

+ (UIColor *)textTheme{
  return [UIColor colorWithHexString:@"#010101"];
}

+ (UIColor *)tabbarTtitle{
  return [UIColor colorWithHexString:@"#a7a7a7"];
}

@end
