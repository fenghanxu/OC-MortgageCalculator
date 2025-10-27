//
//  AnimationManager.h
//  Frame
//
//  Created by 冯汉栩 on 2025/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AnimationDirection) {
    AnimationDirectionUp,
    AnimationDirectionDown,
    AnimationDirectionLeft,
    AnimationDirectionRight
};

@interface AnimationManager : NSObject

+ (void)startAnimationForView:(UIView *)view
            animationDirection:(AnimationDirection)direction
                        offset:(CGFloat)offset
                        delay:(NSTimeInterval)delay;


@end

NS_ASSUME_NONNULL_END
