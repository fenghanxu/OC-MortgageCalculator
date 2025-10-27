//
//  WaveButton.m
//  Frame
//
//  Created by 冯汉栩 on 2025/4/22.
//

#import "WaveButton.h"

@interface WaveButton ()
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;
@end

@implementation WaveButton

- (instancetype)initWithTitle:(NSString *)title
                selectedTitle:(NSString *)selectedTitle
                normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectedColor {
    self = [super init];
    if (self) {
        self.normalColor = normalColor;
        self.selectedColor = selectedColor;
        [self commonInit];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:selectedTitle forState:UIControlStateSelected];
    }
    return self;
}

- (void)commonInit {
    // 默认配置
    _waveCount       = 3.0;  // 波浪层数量
    _waveExpandRatio = 2.0;  // 波浪扩展比例
    _waveStartAlpha  = 0.3;  // 波浪起始透明度
    _waveEndAlpha    = 0.0;  // 波浪结束透明度
    _waveDuration    = 3.0;  // 波浪动画持续时间
    
    // 如果没有设置颜色，使用默认颜色
    if (!_normalColor) {
        _normalColor = [UIColor colorWithRed:60.0/255.0 green:179/255.0 blue:113/255.0 alpha:1.0];
    }
    if (!_selectedColor) {
        _selectedColor = [UIColor colorWithRed:220.0/255.0 green:20.0/255.0 blue:60.0/255.0 alpha:1.0];
    }
    
    // 按钮基本样式
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.backgroundColor = _normalColor;
    self.layer.cornerRadius = 30;
    self.clipsToBounds = YES;
    
    // 初始化波浪层数组
    _waveLayers = [NSMutableArray array];
    
    // 添加点击事件
    [self addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.clipsToBounds = YES;
    
    // 更新波浪层位置
    for (CAShapeLayer *waveLayer in self.waveLayers) {
        waveLayer.position = self.center;
    }
    
    [self startWaveAnimation];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    if (self.superview) {
        [self createWaveLayers];
    } else {
        [self stopWaveAnimation];
        for (CAShapeLayer *waveLayer in self.waveLayers) {
            [waveLayer removeFromSuperlayer];
        }
        [self.waveLayers removeAllObjects];
    }
}

- (void)createWaveLayers {
    // 移除旧的波浪层
    for (CAShapeLayer *waveLayer in self.waveLayers) {
        [waveLayer removeFromSuperlayer];
    }
    [self.waveLayers removeAllObjects];
    
    // 创建新的波浪层
    for (NSInteger i = 0; i < self.waveCount; i++) {
        CAShapeLayer *waveLayer = [CAShapeLayer layer];
        waveLayer.fillColor = (self.waveColor ?: self.backgroundColor).CGColor;
        waveLayer.strokeColor = [UIColor clearColor].CGColor;
        waveLayer.lineWidth = 0;
        [self.superview.layer insertSublayer:waveLayer below:self.layer];
        [self.waveLayers addObject:waveLayer];
    }
}

- (void)startWaveAnimation {
    CGFloat initialRadius = self.bounds.size.width / 2;
    CGFloat finalRadius = initialRadius * self.waveExpandRatio;
    
    for (NSInteger i = 0; i < self.waveLayers.count; i++) {
        CAShapeLayer *waveLayer = self.waveLayers[i];
        [waveLayer removeAllAnimations];
        
        UIBezierPath *startPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero
                                                              radius:initialRadius
                                                          startAngle:0
                                                            endAngle:2 * M_PI
                                                           clockwise:YES];
        
        UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero
                                                            radius:finalRadius
                                                        startAngle:0
                                                          endAngle:2 * M_PI
                                                         clockwise:YES];
        
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        pathAnimation.fromValue = (__bridge id)startPath.CGPath;
        pathAnimation.toValue = (__bridge id)endPath.CGPath;
        pathAnimation.duration = self.waveDuration;
        
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @(self.waveStartAlpha);
        opacityAnimation.toValue = @(self.waveEndAlpha);
        opacityAnimation.duration = self.waveDuration;
        
        CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
        groupAnimation.animations = @[pathAnimation, opacityAnimation];
        groupAnimation.duration = self.waveDuration;
        groupAnimation.repeatCount = HUGE_VALF;
        groupAnimation.beginTime = CACurrentMediaTime() + (i * self.waveDuration / self.waveLayers.count);
        
        [waveLayer addAnimation:groupAnimation forKey:@"waveAnimation"];
    }
}

- (void)stopWaveAnimation {
    for (CAShapeLayer *waveLayer in self.waveLayers) {
        [waveLayer removeAllAnimations];
    }
}

- (void)buttonTapped:(UIButton *)button {
    self.selected = !self.selected;
    [self updateButtonAppearance];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self updateButtonAppearance];
}

- (void)updateButtonAppearance {
    if (self.selected) {
        self.backgroundColor = self.selectedColor;
        self.waveColor = self.selectedColor;
    } else {
        self.backgroundColor = self.normalColor;
        self.waveColor = self.normalColor;
    }
}

- (void)setWaveColor:(UIColor *)waveColor {
    _waveColor = waveColor;
    for (CAShapeLayer *waveLayer in self.waveLayers) {
        waveLayer.fillColor = waveColor.CGColor;
    }
}

- (void)dealloc {
    [self stopWaveAnimation];
}

@end
