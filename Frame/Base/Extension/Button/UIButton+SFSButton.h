//
//  UIButton+SFSButton.h
//  SFS.Plan
//
//  Created by LarryLiu on 2017/5/2.
//  Copyright © 2017年 OCN. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickActionBlock) (id obj);

typedef NS_ENUM(NSUInteger, LContentAdjustType) {
    LContentAdjustImageLeftTitleRight = 0,// default
    LContentAdjustImageRightTitleLeft,
    LContentAdjustImageUpTitleDown,
    LContentAdjustImageDownTitleUp
};


@interface UIButton (SFSButton)

+ (UIButton *)addBtnWithFrame:(CGRect)frame setFrame:(CGRect)CGRectMake setFont:(CGFloat)size setNormalTitle:(NSString *)normalTitle setSelectedTitle:(NSString *)selectedTitle setNormalTitleColor:(UIColor *)color setSelectTitleColor:(NSString *)hexString andSetBackImage:(UIImage *)image;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

//Button点击事件的block
- (void)initWithBlock:(ClickActionBlock)clickBlock for:(UIControlEvents)event;

//图片在上，文字在下
//这个方法应当在图片以及文字内容设置好，并且按钮尺寸已知的情况下才能正常使用
+ (void)setButtonImageUpLabelDown:(UIButton *)btn;


@property (nonatomic, assign) CGFloat lSpace;// 图片与文字的间距 默认是5

/*
 开始调整内容
 
 调用前，请确保设置好title以及image
 */
- (void)l_beginAdjustContentWithLContentAdjustType:(LContentAdjustType)lContentAdjustType;

/*
 l_beginAdjustContent 默认在下一次runloop进行更新，这个方法提供直接更新
 */
- (void)l_beginAdjustContentImmediatelyLContentAdjustType:(LContentAdjustType)lContentAdjustType;

/*
 可以传入文字最大宽度
 */
- (void)l_beginAdjustContentWithMaxTitleWidth:(CGFloat)maxTitleWidth LContentAdjustType:(LContentAdjustType)lContentAdjustType;


@end
