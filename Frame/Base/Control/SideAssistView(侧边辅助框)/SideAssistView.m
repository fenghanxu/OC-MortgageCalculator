//
//  SideAssistView.m
//  Chat
//
//  Created by 冯汉栩 on 2025/9/30.
//

#import "SideAssistView.h"

@interface SideAssistView()
@property (nonatomic,   copy) SideAssistViewBlock callBlock;
@property (nonatomic, strong) UIView              *bgView;
@property (nonatomic, strong) NSArray             *array;
@property (nonatomic, assign) CGFloat             topHeight;
@end

@implementation SideAssistView

+(void)showWithTestActionView:(UIWindow *)views withArray:(NSArray *)array withBlock:(SideAssistViewBlock)block {
    SideAssistView *tipView = [[SideAssistView alloc] initWithFrame:CGRectZero withArray:array byCallBlock:block];
    tipView.addTo(views).makeCons(^{
        make.left.top.right.bottom.equal.view(views);
    });
    [tipView show];
}

- (instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array byCallBlock:(SideAssistViewBlock)callBlock{
    self = [super initWithFrame:frame];
    CGFloat navHeight = [GetVC getCurrentViewController].navigationController.navigationBar.frame.size.height;
    self.callBlock = callBlock;
    self.array     = array;
    self.topHeight = TOTAL_TOP_HEIGHT([GetVC getCurrentViewController]);
    [self buildUI];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self buildUI];
    return self;
}

-(void) buildUI{
    self.backgroundColor = [UIColor clearColor];
    self.hidden = YES;
    self.onClick(^{ [self dismiss];});
    
    self.bgView = [UIView new];
    self.bgView.alpha = 0.f;
    self.bgView.addTo(self).bgColor([UIColor colorWithHexString:@"0x656666"]).borderRadius(5).xywh(SCREEN_WIDTH-135,self.topHeight+10,120,0);
    
    // 循环创建按钮
    for (NSInteger i = 0; i < self.array.count; i++) {
        NSString *title = self.array[i];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, i * 40, self.bgView.frame.size.width, 40);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = 1000 + i; // 用 tag 区分按钮
        [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:btn];
        
        // 添加分割线（最后一个不加）
        if (i < self.array.count - 1) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(btn.frame)-1, self.bgView.frame.size.width - 30, 1)];
            line.backgroundColor = [UIColor whiteColor];
            [self.bgView addSubview:line];
        }
    }
 
}

-(void)show{
    CGFloat bgViewHeight = self.array.count * 40 + self.array.count - 1;
    self.hidden = NO;
    [UIView animateWithDuration:0.2f animations:^{
        self.bgView.alpha = 1.f;
        self.bgView.xywh(SCREEN_WIDTH-135,self.topHeight+10,120,bgViewHeight);
    }];
}

-(void)dismiss{
    [UIView animateWithDuration:0.2f animations:^{
        self.bgView.alpha = 0.f;
        self.bgView.xywh(SCREEN_WIDTH-135,self.topHeight+10,120,0);
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

-(void)buttonTapped:(UIButton *)button {
    NSString *value = button.titleLabel.text; // 或者用 tag 区分
    if (self.callBlock) {
        self.callBlock(value);
    }
    [self dismiss];
}


@end



