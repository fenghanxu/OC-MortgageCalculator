//
//  WaveButton.h
//  Frame
//
//  Created by 冯汉栩 on 2025/4/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WaveButton : UIButton

// 波浪效果相关属性
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *waveLayers;
@property (nonatomic, assign) NSInteger waveCount;              // 波浪层数量 (默认3)
@property (nonatomic, assign) CGFloat waveExpandRatio;          // 波浪扩展比例 (默认2.0)
@property (nonatomic, assign) CGFloat waveStartAlpha;           // 波浪起始透明度 (默认0.3)
@property (nonatomic, assign) CGFloat waveEndAlpha;             // 波浪结束透明度 (默认0.0)
@property (nonatomic, assign) CFTimeInterval waveDuration;      // 波浪动画持续时间 (默认3.0秒)
@property (nonatomic, strong) UIColor *waveColor;               // 波浪颜色 (默认与按钮颜色相同)

// 初始化方法
- (instancetype)initWithTitle:(NSString *)title
                selectedTitle:(NSString *)selectedTitle
                normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectedColor;

// 控制波浪动画
- (void)startWaveAnimation;
- (void)stopWaveAnimation;

@end

NS_ASSUME_NONNULL_END
