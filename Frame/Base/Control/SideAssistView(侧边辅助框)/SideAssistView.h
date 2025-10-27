//
//  SideAssistView.h
//  Chat
//
//  Created by 冯汉栩 on 2025/9/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SideAssistViewBlock) (NSString* value);

@interface SideAssistView : UIView

+(void)showWithTestActionView:(UIWindow *)views withArray:(NSArray *)array withBlock:(SideAssistViewBlock)block;

@end

NS_ASSUME_NONNULL_END
