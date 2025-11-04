//
//  RepaymentDetailSubView.m
//  Frame
//
//  Created by imac on 2025/11/4.
//

#import "RepaymentDetailSubView.h"

@interface RepaymentDetailSubView()
@property (nonatomic, strong) UILabel *periodLabel;
@property (nonatomic, strong) UIView  *emptyView;
@property (nonatomic, strong) UILabel *monthlyPaymentLabel;
@property (nonatomic, strong) UILabel *principalLabel;
@property (nonatomic, strong) UILabel *interestLabel;
@end

@implementation RepaymentDetailSubView

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
    self.periodLabel.textColor = [Color textBlank];
    self.periodLabel.addTo(self).str(@"第一期").fnt(14).centerAlignment.makeCons(^{
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
    self.monthlyPaymentLabel.textColor = [Color textBlank];
    self.monthlyPaymentLabel.addTo(self).str(@"5307").fnt(14).centerAlignment.makeCons(^{
        make.left.equal.view(self.emptyView).right.constants(0);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.24);
    });

    self.principalLabel = [UILabel new];
    self.principalLabel.textColor = [Color textBlank];
    self.principalLabel.addTo(self).str(@"1224").fnt(14).centerAlignment.makeCons(^{
        make.left.equal.view(self.monthlyPaymentLabel).right.constants(0);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.24);
    });

    self.interestLabel = [UILabel new];
    self.interestLabel.textColor = [Color textBlank];
    self.interestLabel.addTo(self).str(@"4083").fnt(14).centerAlignment.makeCons(^{
        make.left.equal.view(self.principalLabel).right.constants(0);
        make.top.bottom.equal.view(self);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.24);
    });
}

@end
