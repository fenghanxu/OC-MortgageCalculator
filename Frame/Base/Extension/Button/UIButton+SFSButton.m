//
//  UIButton+SFSButton.m
//  SFS.Plan
//
//  Created by LarryLiu on 2017/5/2.
//  Copyright © 2017年 OCN. All rights reserved.
//

#import "UIButton+SFSButton.h"
#import <objc/runtime.h>

static id key;

const char  lSpaceKey;

@implementation UIButton (SFSButton)


#pragma mark -封装添加按钮方法
+ (UIButton *)addBtnWithFrame:(CGRect)frame setFrame:(CGRect)CGRectMake setFont:(CGFloat)size setNormalTitle:(NSString *)normalTitle setSelectedTitle:(NSString *)selectedTitle setNormalTitleColor:(UIColor *)color setSelectTitleColor:(NSString *)hexString andSetBackImage:(UIImage *)image{
    
    UIButton *menuBtn = [[UIButton alloc] initWithFrame:frame];
    [menuBtn setFrame:CGRectMake];
    menuBtn.titleLabel.font = [UIFont systemFontOfSize:size];
    [menuBtn setTitle:normalTitle forState:UIControlStateNormal];
    [menuBtn setTitle:selectedTitle forState:UIControlStateSelected];
    [menuBtn setTitleColor:color forState:UIControlStateNormal];
    [menuBtn setTitleColor:[UIColor colorWithHexString:hexString] forState:UIControlStateSelected];
    [menuBtn setBackgroundImage:image forState:UIControlStateNormal];
    menuBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    return menuBtn;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)initWithBlock:(ClickActionBlock)clickBlock for:(UIControlEvents)event{

    objc_setAssociatedObject(self, &key, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(goAction:) forControlEvents:event];
    

}

- (void)goAction:(UIButton *)sender{
    
    ClickActionBlock block = (ClickActionBlock)objc_getAssociatedObject(self, &key);
    
    if (block) {
        
        block(sender);
        
    }
    
    
    
}

//图片在上，文字在下
//这个方法应当在图片以及文字内容设置好，并且按钮尺寸已知的情况下才能正常使用
+ (void)setButtonImageUpLabelDown:(UIButton *)btn{
    
    float  spacing = btn.lSpace;//图片和文字的上下间距
    CGSize imageSize = btn.imageView.frame.size;
    CGSize titleSize = btn.titleLabel.frame.size;
    CGSize textSize = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    btn.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);


}


- (void)l_beginAdjustContentWithLContentAdjustType:(LContentAdjustType)lContentAdjustType {
    [self l_beginAdjustContentWithMaxTitleWidth:0 LContentAdjustType:lContentAdjustType];
}

- (void)l_beginAdjustContentImmediatelyLContentAdjustType:(LContentAdjustType)lContentAdjustType{
    [self _l_beginAdjustContentWithMaxTitleWidth:0 LContentAdjustType:lContentAdjustType];
}

- (void)l_beginAdjustContentWithMaxTitleWidth:(CGFloat)maxTitleWidth LContentAdjustType:(LContentAdjustType)lContentAdjustType{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self _l_beginAdjustContentWithMaxTitleWidth:maxTitleWidth LContentAdjustType:lContentAdjustType];
    });
}

- (void)l_beginAdjustContentImmediatelyWithMaxTitleWidth:(CGFloat)maxTitleWidth LContentAdjustType:(LContentAdjustType)lContentAdjustType{
    [self _l_beginAdjustContentWithMaxTitleWidth:maxTitleWidth LContentAdjustType:lContentAdjustType];
}

#pragma mark---- private

- (void)_l_beginAdjustContentWithMaxTitleWidth:(CGFloat)maxTitleWidth LContentAdjustType:(LContentAdjustType)lContentAdjustType{
    UIImage    * btnImage = self.imageView.image;
    NSString    * btnTitle = self.titleLabel.text;
    
    if (!btnImage || btnTitle.length <= 0) {
        NSAssert(false, @"请先设置按钮的图片以及文字");
        return;
    }
    
    CGSize imageSize = btnImage.size;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    
    CGSize titleSize = [self.titleLabel sizeThatFits:CGSizeZero];
    CGFloat titleWidth = titleSize.width;
    CGFloat titleHeight = titleSize.height;
    
    if (maxTitleWidth > 0 && titleWidth > maxTitleWidth) {
        titleWidth = maxTitleWidth;
    }
    
    CGFloat space = self.lSpace;
    
    switch (lContentAdjustType) {
        case LContentAdjustImageLeftTitleRight: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (space*0.5), 0, -(space*0.5))];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -(space*0.5), 0, (space*0.5))];
        }
            break;
        case LContentAdjustImageRightTitleLeft: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageWidth+space*0.5), 0, (imageWidth+space*0.5))];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, (titleWidth + space*0.5), 0, -(titleWidth + space*0.5))];
        }
            break;
        case LContentAdjustImageUpTitleDown: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake((titleHeight+space)*0.5, -imageWidth*0.5, -(titleHeight+space)*0.5, imageWidth*0.5)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight+space)*0.5, titleWidth*0.5, (imageHeight+space)*0.5, -titleWidth*0.5)];
        }
            break;
        case LContentAdjustImageDownTitleUp: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(-(titleHeight+space)*0.5, -imageWidth*0.5, (titleHeight+space)*0.5, imageWidth*0.5)];
            [self setImageEdgeInsets:UIEdgeInsetsMake((imageHeight+space)*0.5, titleWidth*0.5, -(imageHeight+space)*0.5, -titleWidth*0.5)];
        }
            break;
        default: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (space*0.5), 0, -(space*0.5))];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -(space*0.5), 0, (space*0.5))];
        }
            break;
    }
}

#pragma mark---- getter and setter

- (CGFloat)lSpace{
    return [objc_getAssociatedObject(self, &lSpaceKey) floatValue];
}


- (void)setLSpace:(CGFloat)lSpace{
    objc_setAssociatedObject(self, &lSpaceKey, @(lSpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}





@end
