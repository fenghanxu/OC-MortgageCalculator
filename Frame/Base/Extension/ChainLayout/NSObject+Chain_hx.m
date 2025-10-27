//
//  NSObject+Chain_hx.m
//  Frame
//
//  Created by 冯汉栩 on 2022/1/29.
//

#import "NSObject+Chain_hx.h"

#import <objc/runtime.h>

typedef id (^LinkId)(id property);

typedef id (^LinkInt)(NSInteger inter);//use int
typedef id (^LinkCGFloat)(CGFloat cgfloater);// use CGFloat
typedef id (^LinkDouble)(double doubler);//
typedef id (^LinkBOOL)(bool booler);

typedef id (^LinkSize)(CGSize sizer);
typedef id (^LinkRect)(CGRect recter);
typedef id (^LinkInset)(UIEdgeInsets inseter);

@implementation NSObject (Chain_hx)

+ (void)load {
    
    [UIView hxChainList];
    [UIImageView hxChainList];
    [UITextField hxChainList];
    [UITextView hxChainList];
    [UILabel hxChainList];
    [UIButton hxChainList];
    
}

+ (void)hxChainList {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSDictionary *nomalDic = [self chainDictionary];
    NSDictionary *customDic = [self customChainDictionary];
    
    [dic addEntriesFromDictionary:nomalDic];
    [dic addEntriesFromDictionary:customDic];
    
    if (!dic.allKeys.count) return ;
    
    for (NSString *key in dic.allKeys) {
        
        NSString *value = dic[key];
        
        NSString *selString = [@"hx_" stringByAppendingString:value];
        
        SEL sel = NSSelectorFromString(selString);
        
        Method hx_method = class_getInstanceMethod([NSObject class],sel);
        
        if (!hx_method) {
            NSAssert(hx_method == nil,([NSString stringWithFormat:@"TODO|FIXME - Chain Error -> %@ chainType not be %@",key,value]));
            continue;
        }
        class_addMethod(self, NSSelectorFromString(key), method_getImplementation(hx_method), method_getTypeEncoding(hx_method));
    }
}

//void hxChainAllPropertyList(NSString *className) {
//
//    Method hx_xxx_Method = class_getInstanceMethod([NSObject class],@selector(hx_id));
//
//    unsigned int propertyCount = 0;
//    objc_property_t *propertys = class_copyPropertyList([NSClassFromString(className) class], &propertyCount);
//    for (unsigned int i = 0; i < propertyCount; i ++) {
//        objc_property_t *thisProperty = &propertys[i];
//        const char* propertyName = property_getName(*thisProperty);
////      NSLog(@"%@ -- > %s",className,propertyName);
//        NSString *proString = [NSString stringWithFormat:@"%s",propertyName];
//
//        if (strncmp(propertyName,"_",1) == 0) {
//
//            proString = [@"hx" stringByAppendingString:proString];
//        } else {
//            proString = [@"hx_" stringByAppendingString:proString];
//        }
//
//        class_addMethod(NSClassFromString(className), NSSelectorFromString(proString), method_getImplementation(hx_xxx_Method), method_getTypeEncoding(hx_xxx_Method));
//    }
//    free(propertys);
//}


// id -
- (id _Nonnull (^)(id _Nonnull ))hx_id {
    
    return hx_link_id(self, _cmd);
}

LinkId hx_link_id(id ins,SEL sel) {
    
    return ^id (id property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:property forKey:propertyName];
        
        return ins;
    };
}

// int -
- (id _Nonnull (^)(NSInteger ))hx_int {
    
    return hx_link_int(self, _cmd);
}

LinkInt hx_link_int(id ins,SEL sel) {
    
    return ^(NSInteger property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:@(property) forKey:propertyName];
        
        return ins;
    };
}

// CGFloat -
- (id _Nonnull (^)(CGFloat ))hx_CGFloat {
    
    return hx_link_CGFloat(self, _cmd);
}

LinkCGFloat hx_link_CGFloat(id ins,SEL sel) {
    
    return ^(CGFloat property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:@(property) forKey:propertyName];
        
        return ins;
    };
}

// double -
- (id _Nonnull (^)(double ))hx_double {
    
    return hx_link_double(self, _cmd);
}

LinkCGFloat hx_link_double(id ins,SEL sel) {
    
    return ^(double property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:@(property) forKey:propertyName];
        
        return ins;
    };
}

// bool -
- (id _Nonnull (^)(bool ))hx_bool {
    
    return hx_link_bool(self, _cmd);
}

LinkBOOL hx_link_bool(id ins,SEL sel) {
    
    return ^(bool property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:@(property) forKey:propertyName];
        
        return ins;
    };
}

// size -
- (id _Nonnull (^)(CGSize ))hx_size {
    
    return hx_link_size(self, _cmd);
}

LinkSize hx_link_size(id ins,SEL sel) {
    
    return ^(CGSize property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:@(property) forKey:propertyName];
        
        return ins;
    };
}

// rect -
- (id _Nonnull (^)(CGRect ))hx_rect {
    
    return hx_link_rect(self, _cmd);
}

LinkRect hx_link_rect(id ins,SEL sel) {
    
    return ^(CGRect property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:@(property) forKey:propertyName];
        
        return ins;
    };
}

// inset -
- (id _Nonnull (^)(UIEdgeInsets ))hx_inset {
    
    return hx_link_inset(self, _cmd);
}

LinkInset hx_link_inset(id ins,SEL sel) {
    
    return ^(UIEdgeInsets property) {
        
        NSString *propertyName = [NSStringFromSelector(sel) stringByReplacingOccurrencesOfString:@"hx_" withString:@""];
        
        [ins setValue:[NSValue valueWithUIEdgeInsets:property] forKey:propertyName];
        
        return ins;
    };
}

// - 默认链
+ (NSDictionary *)chainDictionary {
    
    return [NSDictionary dictionary];
}

// - 自定义链
+ (NSDictionary *)customChainDictionary {
    
    return [NSDictionary dictionary];
}

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation UIView (Chain_hx)

+ (NSDictionary *)chainDictionary {
    
    return @{@"hx_userInteractionEnabled":@"bool",
             @"hx_tag":@"int",
             @"hx_frame":@"rect",
             @"hx_bounds":@"rect",
             @"hx_center":@"size",
             @"hx_backgroundColor":@"id",
             @"hx_alpha":@"CGFloat",
             @"hx_hidden":@"bool",
             @"hx_contentMode":@"int",
             @"hx_tintColor":@"id",
             };
}

//- (UIView * _Nonnull (^)(CGRect ))hx_frame {
//
//    return ^(CGRect frame) {
//
//        self.frame = frame;
//
//        return self;
//    };
//}

@end

@implementation UIImageView (Chain_hx)

+ (NSDictionary *)chainDictionary {
    
    return @{@"hx_image":@"id",
             @"hx_highlightedImage":@"id",
             @"hx_highlighted":@"bool",
             @"hx_animationImages":@"id",
             @"hx_highlightedAnimationImages":@"id",
             @"hx_animationDuration":@"double",
             @"hx_animationRepeatCount":@"int",
             };
}

@end

@implementation UITextField (Chain_hx)

+ (NSDictionary *)chainDictionary {
    
    return @{@"hx_text":@"id",
             @"hx_attributedText":@"id",
             @"hx_textColor":@"id",
             @"hx_font":@"id",
             @"hx_textAlignment":@"int",
             @"hx_borderStyle":@"int",
             @"hx_defaultTextAttributes":@"id",
             @"hx_placeholder":@"id",
             @"hx_attributedPlaceholder":@"id",
             @"hx_clearsOnBeginEditing":@"bool",
             @"hx_adjustsFontSizeToFitWidth":@"bool",
             @"hx_minimumFontSize":@"CGFloat",
             @"hx_background":@"id",
             @"hx_disabledBackground":@"id",
             };
}

@end

@implementation UITextView (Chain_hx)

+ (NSDictionary *)chainDictionary {
    
    return @{@"hx_text":@"id",
             @"hx_textColor":@"id",
             @"hx_font":@"id",
             @"hx_textAlignment":@"int",
             @"hx_editable":@"bool",
             @"hx_attributedText":@"id",
             @"hx_allowsEditingTextAttributes":@"bool",
             };
}

@end

@implementation UILabel (Chain_hx)

+ (NSDictionary *)chainDictionary {
    
    return @{@"hx_text":@"id",
             @"hx_font":@"id",
             @"hx_textColor":@"id",
             @"hx_shadowColor":@"id",
             @"hx_shadowOffset":@"size",
             @"hx_textAlignment":@"int",
             @"hx_lineBreakMode":@"int",
             @"hx_attributedText":@"id",
             @"hx_highlightedTextColor":@"id",
             @"hx_highlighted":@"bool",
             @"hx_enabled":@"bool",
             @"hx_numberOfLines":@"int",
             @"hx_adjustsFontSizeToFitWidth":@"bool",
             @"hx_baselineAdjustment":@"int",
             
             };
}

@end

@implementation UIButton (Chain_hx)

+ (NSDictionary *)chainDictionary {
    
    return @{@"hx_contentEdgeInsets":@"inset",
             @"hx_titleEdgeInsets":@"inset",
             @"hx_imageEdgeInsets":@"inset",
             };
}

- (UIButton * _Nonnull (^)(NSString * ,UIControlState ))hx_title {

    return ^(NSString *title ,UIControlState state ) {

        [self setTitle:title forState:state];

        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * ,UIControlState ))hx_titleColor {
    
    return ^(UIColor *color ,UIControlState state ) {
        
        [self setTitleColor:color forState:state];
        
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIColor * ,UIControlState ))hx_titleShadowColor {
    
    return ^(UIColor *color ,UIControlState state ) {
        
        [self setTitleShadowColor:color forState:state];
        
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * ,UIControlState ))hx_image {
    
    return ^(UIImage *image ,UIControlState state ) {
        
        [self setImage:image forState:state];
        
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * ,UIControlState ))hx_backgroundImage {
    
    return ^(UIImage *bgImage ,UIControlState state ) {
        
        [self setBackgroundImage:bgImage forState:state];
        
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSAttributedString * ,UIControlState ))hx_attributedTitle {
    
    return ^(NSAttributedString *attributedTitle ,UIControlState state ) {
        
        [self setAttributedTitle:attributedTitle forState:state];
        
        return self;
    };
}

@end
