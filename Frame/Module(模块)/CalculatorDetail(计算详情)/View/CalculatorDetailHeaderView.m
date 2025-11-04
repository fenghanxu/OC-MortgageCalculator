//
//  CalculatorDetailHeaderView.m
//  Frame
//
//  Created by 冯汉栩 on 2025/11/4.
//

#import "CalculatorDetailHeaderView.h"

@interface CalculatorDetailHeaderView()
@property (nonatomic, strong) UILabel *periodLabel;
@property (nonatomic, strong) UIView  *emptyView;
@property (nonatomic, strong) UILabel *monthlyPaymentLabel;
@property (nonatomic, strong) UILabel *principalLabel;
@property (nonatomic, strong) UILabel *interestLabel;
@end

@implementation CalculatorDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI {
    self.backgroundColor = [UIColor whiteColor];
    
    self.periodLabel = [UILabel new];
    self.periodLabel.textColor = [Color textSub];
    self.periodLabel.addTo(self).str(@"期数").fnt(14).centerAlignment.makeCons(^{
        make.left.equal.view(self);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.2);
    });
    
    self.emptyView = [UIView new];
    self.emptyView.addTo(self).bgColor([UIColor whiteColor]).makeCons(^{
        make.left.equal.view(self.periodLabel).right.constants(0);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.08);
    });
    
    self.monthlyPaymentLabel = [UILabel new];
    self.monthlyPaymentLabel.textColor = [Color textSub];
    self.monthlyPaymentLabel.addTo(self).str(@"月供(元)").fnt(14).centerAlignment.makeCons(^{
        make.left.equal.view(self.emptyView).right.constants(0);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.24);
    });

    self.principalLabel = [UILabel new];
    self.principalLabel.textColor = [Color textSub];
    self.principalLabel.addTo(self).str(@"本金(元)").fnt(14).centerAlignment.makeCons(^{
        make.left.equal.view(self.monthlyPaymentLabel).right.constants(0);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.24);
    });

    self.interestLabel = [UILabel new];
    self.interestLabel.textColor = [Color textSub];
    self.interestLabel.addTo(self).str(@"利息(元)").fnt(14).centerAlignment.makeCons(^{
        make.left.equal.view(self.principalLabel).right.constants(0);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.24);
    });
}

@end
