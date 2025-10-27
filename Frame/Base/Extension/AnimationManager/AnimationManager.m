//
//  AnimationManager.m
//  Frame
//
//  Created by 冯汉栩 on 2025/3/11.
//

#import "AnimationManager.h"

@interface AnimationManager ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, weak) UIView *animatingView;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CFTimeInterval startTime;
@property (nonatomic, assign) NSTimeInterval duration;

@end

@implementation AnimationManager

+ (void)startAnimationForView:(UIView *)view
            animationDirection:(AnimationDirection)direction
                        offset:(CGFloat)offset
                        delay:(NSTimeInterval)delay {
    [[AnimationManager alloc] startAnimationForView:view animationDirection:direction offset:offset delay:delay];
}

- (void)startAnimationForView:(UIView *)view
            animationDirection:(AnimationDirection)direction
                        offset:(CGFloat)offset
                         delay:(NSTimeInterval)delay {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.animatingView = view;
        self.startTime = CACurrentMediaTime();
        self.duration = 5.0;

        CGPoint start = view.center;
        CGPoint end = start;

        switch (direction) {
            case AnimationDirectionUp:
                end.y -= offset;
                break;
            case AnimationDirectionDown:
                end.y += offset;
                break;
            case AnimationDirectionLeft:
                end.x -= offset;
                break;
            case AnimationDirectionRight:
                end.x += offset;
                break;
            default:
                break;
        }

        self.startPoint = start;
        self.endPoint = end;

        [self startDisplayLink];
    });
}

- (void)startDisplayLink {
    [self stopDisplayLink];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateAnimation)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopDisplayLink {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)updateAnimation {
    CFTimeInterval now = CACurrentMediaTime();
    CFTimeInterval elapsed = now - self.startTime;

    CGFloat t = MIN(elapsed / self.duration, 1.0);

    // ✅ 使用经典的 easeOut 曲线（从快到慢）
    // 曲线公式：easeOutCubic: 1 - (1 - t)^3
    CGFloat eased = 1 - pow(1 - t, 3);

    // 更新中心位置
    CGFloat x = self.startPoint.x + (self.endPoint.x - self.startPoint.x) * eased;
    CGFloat y = self.startPoint.y + (self.endPoint.y - self.startPoint.y) * eased;

    self.animatingView.center = CGPointMake(x, y);
    self.animatingView.alpha = eased; // 渐显透明度

    if (t >= 1.0) {
        [self stopDisplayLink];
    }
}

@end
