//
//  NSObject+Chain_hx.h
//  Frame
//
//  Created by 冯汉栩 on 2022/1/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSObject (Chain_hx)

/**
 类调用注册链式 - UIView,UIImageView,UITextField,UITextView,UILabel,UIButton 已注册
 */
+ (void)hxChainList;


/**
 默认链

 @return @{@"hx_<#property#>":@"<#type#>"} - type:  id -> id
                                            int -> NSInteger
                                            CGFloat -> CGFloat
                                            double -> double
                                            bool -> BOOL
                                            size -> eg:CGSize,CGPoint--- 结构体样式 - struct .. {CGFloat xxx;CGFloat xxx;}
                                            rect -> eg:CGRect        --- 结构体样式 - struct .. {CGSize xxx;CGSize xxx;}
                                            inset -> eg:UIEdgeInsets --- 结构体样式 - struct .. {CGFloat xxx, xxx, xxx, xxx;}
 */
+ (NSDictionary *)chainDictionary;

/**
 自定义链

 @return @{@"hx_<#property#>":@"<#type#>"} - type:  id -> id
                                            int -> NSInteger
                                            CGFloat -> CGFloat
                                            double -> double
                                            bool -> BOOL
                                            size -> eg:CGSize,CGPoint--- 结构体样式 - struct .. {CGFloat xxx;CGFloat xxx;}
                                            rect -> eg:CGRect        --- 结构体样式 - struct .. {CGSize xxx;CGSize xxx;}
                                            inset -> eg:UIEdgeInsets --- 结构体样式 - struct .. {CGFloat xxx, xxx, xxx, xxx;}
 */
+ (NSDictionary *)customChainDictionary;

@end


@interface UIView (Chain_hx)
/** View是否允许交互 */
- (UIView * _Nonnull (^)(BOOL ))hx_userInteractionEnabled;
/** View标识 */
- (UIView * _Nonnull (^)(NSInteger ))hx_tag;
/** View frame约束方式(相对父类)*/
- (UIView * _Nonnull (^)(CGRect ))hx_frame;
/** View bounds约束方式(相对自己)*/
- (UIView * _Nonnull (^)(CGRect ))hx_bounds;
/** View以中心为对齐方式 */
- (UIView * _Nonnull (^)(CGPoint ))hx_center;
/** View背景颜色 */
- (UIView * _Nonnull (^)(UIColor * ))hx_backgroundColor;
/** View 透明度*/
- (UIView * _Nonnull (^)(CGFloat ))hx_alpha;
/** View 是否隐藏*/
- (UIView * _Nonnull (^)(BOOL ))hx_hidden;
/** View 填充方式*/
- (UIView * _Nonnull (^)(UIViewContentMode ))hx_contentMode;
/** View 描边颜色*/
- (UIView * _Nonnull (^)(UIColor * ))hx_tintColor;

@end

@interface UIImageView (Chain_hx)
/** ImageView设置图片 */
- (UIImageView * _Nonnull (^)(UIImage * ))hx_image;
/** ImageView高亮图片 */
- (UIImageView * _Nonnull (^)(UIImage * ))hx_highlightedImage;
/** ImageView 设置高亮状态(默认不是高亮状态)*/
- (UIImageView * _Nonnull (^)(BOOL ))hx_highlighted;
/** ImageView(加入图片数组可播放动画) */
- (UIImageView * _Nonnull (^)(NSArray<UIImage *> * ))hx_animationImages;
/** ImageView(加入高亮图片数组可播放动画)  */
- (UIImageView * _Nonnull (^)(NSArray<UIImage *> * ))hx_highlightedAnimationImages;
/** ImageView 动画播放时间*/
- (UIImageView * _Nonnull (^)(NSTimeInterval ))hx_animationDuration;
/** ImageView 动画播放重复次数*/
- (UIImageView * _Nonnull (^)(NSInteger ))hx_animationRepeatCount;

/** ImageView 是否允许交互*/
//UIView - on
- (UIImageView * _Nonnull (^)(BOOL ))hx_userInteractionEnabled;
/** ImageView 标识*/
- (UIImageView * _Nonnull (^)(NSInteger ))hx_tag;
/** ImageView 约束对齐方式(相对父类)*/
- (UIImageView * _Nonnull (^)(CGRect ))hx_frame;
/** ImageView 约束对齐方式(相对自己) */
- (UIImageView * _Nonnull (^)(CGRect ))hx_bounds;
/** ImageView 以中心为对齐方式约束*/
- (UIImageView * _Nonnull (^)(CGPoint ))hx_center;
/** ImageView背景颜色 */
- (UIImageView * _Nonnull (^)(UIColor * ))hx_backgroundColor;
/** ImageView 透明度*/
- (UIImageView * _Nonnull (^)(CGFloat ))hx_alpha;
/** ImageView 是否隐藏*/
- (UIImageView * _Nonnull (^)(BOOL ))hx_hidden;
/** ImageView 填充模式*/
- (UIImageView * _Nonnull (^)(UIViewContentMode ))hx_contentMode;
/** ImageView边框颜色 */
- (UIImageView * _Nonnull (^)(UIColor * ))hx_tintColor;

@end

@interface UITextField (Chain_hx)
/** TextField 文本内容 */
- (UITextField * _Nonnull (^)(NSString * ))hx_text;
/** TextField 文本富文本 */
- (UITextField * _Nonnull (^)(NSAttributedString * ))hx_attributedText;
/** TextField 文字颜色*/
- (UITextField * _Nonnull (^)(UIColor * ))hx_textColor;
/** TextField 文字大小*/
- (UITextField * _Nonnull (^)(UIFont * ))hx_font;
/** TextField  对齐方式*/
- (UITextField * _Nonnull (^)(NSTextAlignment ))hx_textAlignment;
/** TextField 边框样式*/
- (UITextField * _Nonnull (^)(UITextBorderStyle ))hx_borderStyle;
/** TextField  提示语设置文字大小颜色等*/
- (UITextField * _Nonnull (^)(NSDictionary<NSAttributedStringKey,id> * ))hx_defaultTextAttributes;
/** TextField 提示语 */
- (UITextField * _Nonnull (^)(NSString * ))hx_placeholder;
/** TextField提示语富文本 */
- (UITextField * _Nonnull (^)(NSAttributedString * ))hx_attributedPlaceholder;
/** TextField每次输入会把上一次的内容清空 */
- (UITextField * _Nonnull (^)(BOOL ))hx_clearsOnBeginEditing;
/** TextField 根据宽高自适应内容大小*/
- (UITextField * _Nonnull (^)(BOOL ))hx_adjustsFontSizeToFitWidth;
/** TextField 设置最小字体大小*/
- (UITextField * _Nonnull (^)(CGFloat ))hx_minimumFontSize;
/** TextField 背景图片*/
- (UITextField * _Nonnull (^)(UIImage * ))hx_background;
/** TextField 缺失背景(未知)*/
- (UITextField * _Nonnull (^)(UIImage * ))hx_disabledBackground;

/** TextField 是否允许交互*/
//UIView - on
- (UITextField * _Nonnull (^)(BOOL ))hx_userInteractionEnabled;
/** TextField标识 */
- (UITextField * _Nonnull (^)(NSInteger ))hx_tag;
/** TextField 约束位置(相对父类) */
- (UITextField * _Nonnull (^)(CGRect ))hx_frame;
/** TextField约束位置(相对自己) */
- (UITextField * _Nonnull (^)(CGRect ))hx_bounds;
/** TextField 以中心对齐方式约束*/
- (UITextField * _Nonnull (^)(CGPoint ))hx_center;
/** TextField 背景颜色*/
- (UITextField * _Nonnull (^)(UIColor * ))hx_backgroundColor;
/** TextField 透明度*/
- (UITextField * _Nonnull (^)(CGFloat ))hx_alpha;
/** TextField是否允许显示 */
- (UITextField * _Nonnull (^)(BOOL ))hx_hidden;
/** TextField 填充方式*/
- (UITextField * _Nonnull (^)(UIViewContentMode ))hx_contentMode;
/** TextField 描边颜色*/
- (UITextField * _Nonnull (^)(UIColor * ))hx_tintColor;

@end

@interface UITextView (Chain_hx)
/** TextView文本内容 */
- (UITextView * _Nonnull (^)(NSString * ))hx_text;
/** TextView 文本颜色*/
- (UITextView * _Nonnull (^)(UIColor * ))hx_textColor;
/** TextView 文本大小*/
- (UITextView * _Nonnull (^)(UIFont * ))hx_font;
/** TextView 文本对齐方式*/
- (UITextView * _Nonnull (^)(NSTextAlignment ))hx_textAlignment;
/** TextView是否允许编辑 */
- (UITextView * _Nonnull (^)(BOOL ))hx_editable;
/** TextView富文本 */
- (UITextView * _Nonnull (^)(NSAttributedString * ))hx_attributedText;
/** TextView是否允许编辑富文本 */
- (UITextView * _Nonnull (^)(BOOL ))hx_allowsEditingTextAttributes;

/** TextView是否允许交互 */
//UIView - on
- (UITextView * _Nonnull (^)(BOOL ))hx_userInteractionEnabled;
/** TextView标识 */
- (UITextView * _Nonnull (^)(NSInteger ))hx_tag;
/** TextView约束位置(相对父类) */
- (UITextView * _Nonnull (^)(CGRect ))hx_frame;
/** TextView 约束位置(相对自己) */
- (UITextView * _Nonnull (^)(CGRect ))hx_bounds;
/** TextView以中心对齐约束 */
- (UITextView * _Nonnull (^)(CGPoint ))hx_center;
/** TextView背景颜色 */
- (UITextView * _Nonnull (^)(UIColor * ))hx_backgroundColor;
/** TextView 透明度*/
- (UITextView * _Nonnull (^)(CGFloat ))hx_alpha;
/** TextView 是否隐藏*/
- (UITextView * _Nonnull (^)(BOOL ))hx_hidden;
/** TextView填充方式 */
- (UITextView * _Nonnull (^)(UIViewContentMode ))hx_contentMode;
/** TextView描边颜色 */
- (UITextView * _Nonnull (^)(UIColor * ))hx_tintColor;

@end

@interface UILabel (Chain_hx)
/** 文本内容 */
- (UILabel * _Nonnull (^)(NSString * _Nonnull))hx_text;
/** 文本大小 */
- (UILabel * _Nonnull (^)(UIFont * _Nonnull))hx_font;
/** 文本颜色 */
- (UILabel * _Nonnull (^)(UIColor * _Nonnull ))hx_textColor;
/** 文本阴影颜色 */
- (UILabel * _Nonnull (^)(UIColor * _Nonnull ))hx_shadowColor;
/** 文本阴影偏移度 */
- (UILabel * _Nonnull (^)(CGSize ))hx_shadowOffset;
/** 文本对齐方式 */
- (UILabel * _Nonnull (^)(NSTextAlignment ))hx_textAlignment;
/** 下划线模式 */
- (UILabel * _Nonnull (^)(NSLineBreakMode ))hx_lineBreakMode;
/** 文本富文本 */
- (UILabel * _Nonnull (^)(NSAttributedString * _Nonnull ))hx_attributedText;
/** 文本高亮颜色 */
- (UILabel * _Nonnull (^)(UIColor * _Nonnull ))hx_highlightedTextColor;
/** 文本高亮状态 */
- (UILabel * _Nonnull (^)(BOOL ))hx_highlighted;
/** 文本是否允许点击(YES变灰，NO常态) */
- (UILabel * _Nonnull (^)(BOOL ))hx_enabled;
/** 文本显示行数 */
- (UILabel * _Nonnull (^)(NSInteger ))hx_numberOfLines;
/** 文本根据长度自适应 */
- (UILabel * _Nonnull (^)(BOOL ))hx_adjustsFontSizeToFitWidth;
/** 线条对齐方式 */
- (UILabel * _Nonnull (^)(UIBaselineAdjustment ))hx_baselineAdjustment;


//UIView - on
/** 文本是否允许交互 */
- (UILabel * _Nonnull (^)(BOOL ))hx_userInteractionEnabled;
/** 文本标识 */
- (UILabel * _Nonnull (^)(NSInteger ))hx_tag;
/** 文本frame (相对屏幕)*/
- (UILabel * _Nonnull (^)(CGRect ))hx_frame;
/** 文本bounds (相对自己)*/
- (UILabel * _Nonnull (^)(CGRect ))hx_bounds;
/** 文本以中心对齐方式去设置 */
- (UILabel * _Nonnull (^)(CGPoint ))hx_center;
/** 文本背景颜色 */
- (UILabel * _Nonnull (^)(UIColor * ))hx_backgroundColor;
/** 文本透明度 */
- (UILabel * _Nonnull (^)(CGFloat ))hx_alpha;
/** 文本是否隐藏 */
- (UILabel * _Nonnull (^)(BOOL ))hx_hidden;
/** 文本填充方式(应用于图片比较多) */
- (UILabel * _Nonnull (^)(UIViewContentMode ))hx_contentMode;
/** 文本描边颜色*/
- (UILabel * _Nonnull (^)(UIColor * ))hx_tintColor;

@end

@interface UIButton (Chain_hx)
/** 按键边距 */
- (UIButton * _Nonnull (^)(UIEdgeInsets ))hx_contentEdgeInsets;
/** 按键文本边距 */
- (UIButton * _Nonnull (^)(UIEdgeInsets ))hx_titleEdgeInsets;
/** 按键图片边距 */
- (UIButton * _Nonnull (^)(UIEdgeInsets ))hx_imageEdgeInsets;
/** 按键文本 */
- (UIButton * _Nonnull (^)(NSString * ,UIControlState ))hx_title;
/** 按键文本颜色 */
- (UIButton * _Nonnull (^)(UIColor * ,UIControlState ))hx_titleColor;
/** 按键文本阴影颜色 */
- (UIButton * _Nonnull (^)(UIColor * ,UIControlState ))hx_titleShadowColor;
/** 按键图片颜色 */
- (UIButton * _Nonnull (^)(UIImage * ,UIControlState ))hx_image;
/** 按键背景图片 */
- (UIButton * _Nonnull (^)(UIImage * ,UIControlState ))hx_backgroundImage;
/** 按键富文本 */
- (UIButton * _Nonnull (^)(NSAttributedString * ,UIControlState ))hx_attributedTitle;

/** 按键是否允许交互 */
//UIView - on
- (UIButton * _Nonnull (^)(BOOL ))hx_userInteractionEnabled;
/** 按键标识 */
- (UIButton * _Nonnull (^)(NSInteger ))hx_tag;
/** 按键frame 约束位置(相对父类)*/
- (UIButton * _Nonnull (^)(CGRect ))hx_frame;
/** 按键bounds 约束位置(相对自己) */
- (UIButton * _Nonnull (^)(CGRect ))hx_bounds;
/** 按键以中心作为对齐方式 */
- (UIButton * _Nonnull (^)(CGPoint ))hx_center;
/** 按键背景颜色 */
- (UIButton * _Nonnull (^)(UIColor * ))hx_backgroundColor;
/** 按键透明度 */
- (UIButton * _Nonnull (^)(CGFloat ))hx_alpha;
/** 按键是否隐藏 */
- (UIButton * _Nonnull (^)(BOOL ))hx_hidden;
/** 按键填充方式 */
- (UIButton * _Nonnull (^)(UIViewContentMode ))hx_contentMode;
/** 按键描边颜色 */
- (UIButton * _Nonnull (^)(UIColor * ))hx_tintColor;

@end

NS_ASSUME_NONNULL_END
