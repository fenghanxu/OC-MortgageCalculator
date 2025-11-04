//
//  DelectedPopupView.m
//  cellsys
//
//  Created by 冯汉栩 on 2025/5/7.
//  Copyright © 2025 LarryLiu. All rights reserved.
//

#import "DelectedPopupView.h"

@interface DelectedPopupView()

@property (nonatomic, copy  ) DelectedPopupViewBlock callBlock;
@property (nonatomic, strong) UIView   *bgView;
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIView   *horizontalLine;
@property (nonatomic, strong) UIView   *portraitLine;
@property (nonatomic, strong) UIButton *cancenButton;
@property (nonatomic, strong) UIButton *commitButton;
@end

@implementation DelectedPopupView

+ (void)showWithTestActionWindow:(UIWindow *)window WithBlock:(DelectedPopupViewBlock)block{
    DelectedPopupView *tipView = [[DelectedPopupView alloc] initWithFrame:CGRectZero byCallBlock:block];
    tipView.addTo(window).makeCons(^{
        make.left.top.right.bottom.equal.view(window);
    });
    [tipView show];
}

- (instancetype)initWithFrame:(CGRect)frame byCallBlock:(DelectedPopupViewBlock)callBlock{
    self = [super initWithFrame:frame];
    self.callBlock = callBlock;
    [self buildUI];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self buildUI];
    return self;
}

-(void) buildUI{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.alpha = 0.f;
    self.hidden = YES;

    self.bgView = [UIView new];
    self.bgView.addTo(self).bgColor([UIColor whiteColor]).borderRadius(5).makeCons(^{
        make.center.equal.view(self);
        make.width.equal.constants(270);
        make.height.equal.constants(140);
    });
    
    self.horizontalLine = [UIView new];
    self.horizontalLine.addTo(self.bgView).bgColor([Color line]).makeCons(^{
        make.height.equal.constants(1);
        make.left.right.equal.view(self.bgView);
        make.centerY.equal.view(self.bgView).constants(10);
    });
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [Color textBlank];
    self.titleLabel.addTo(self.bgView).bgColor([UIColor whiteColor]).str(@"是否清空缓存?").fnt([UIFont boldSystemFontOfSize:18]).centerAlignment.makeCons(^{
        make.top.right.left.equal.view(self.bgView);
        make.bottom.equal.view(self.horizontalLine).top.constants(0);
    });
    
    self.portraitLine = [UIView new];
    self.portraitLine.addTo(self.bgView).bgColor([Color line]).makeCons(^{
        make.top.equal.view(self.horizontalLine).bottom.constants(0);
        make.bottom.equal.view(self.bgView);
        make.width.equal.constants(1);
        make.centerX.equal.view(self.bgView);
    });
    
    self.cancenButton = [UIButton new];
    self.cancenButton.addTo(self.bgView).bgColor([UIColor whiteColor]).str(@"取消").color([Color textBlank]).fnt(16).makeCons(^{
        make.top.equal.view(self.horizontalLine).bottom.constants(0);
        make.right.equal.view(self.portraitLine).left.constants(0);
        make.bottom.equal.view(self.bgView);
        make.left.equal.view(self.bgView);
    }).onClick(^{
        [self dismiss];
    });
    
    self.commitButton = [UIButton new];
    self.commitButton.addTo(self.bgView).bgColor([UIColor whiteColor]).str(@"确认").color([UIColor colorWithRed:218.0/255.0 green:102.0/255.0 blue:94.0/255.0 alpha:1.0]).fnt([UIFont boldSystemFontOfSize:16]).makeCons(^{
        make.top.equal.view(self.horizontalLine).bottom.constants(0);
        make.right.equal.view(self.bgView);
        make.bottom.equal.view(self.bgView);
        make.left.equal.view(self.portraitLine).right.constants(0);
    }).onClick(^{
        self.callBlock(@"删除");
        [self dismiss];
    });

}

-(void)show{
    self.hidden = NO;
    self.bgView.transform = CGAffineTransformMakeScale(0.5, 0.5); // 初始缩小
    
    [UIView animateWithDuration:0.5 // 总动画时间
                          delay:0.0
         usingSpringWithDamping:0.6 // 阻尼系数，越小弹性越大
          initialSpringVelocity:0.8 // 初始速度
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.alpha = 1.f;
        self.bgView.transform = CGAffineTransformIdentity; // 恢复原始大小
    } completion:nil];
}

-(void)dismiss{
    [UIView animateWithDuration:0.3
                     animations:^{
        self.alpha = 0.f;
        self.bgView.transform = CGAffineTransformMakeScale(0.7, 0.7); // 消失时稍微缩小
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

@end

