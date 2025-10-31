//
//  CollectViewCell.m
//  Frame
//
//  Created by 冯汉栩 on 2025/10/30.
//

#import "CollectViewCell.h"

@interface CollectViewCell()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIView *loanAmountView;
@property (nonatomic, strong) UILabel *loanAmountTitle;
@property (nonatomic, strong) UILabel *loanAmountSubtitle;

@property (nonatomic, strong) UIView *loanTermView;
@property (nonatomic, strong) UILabel *loanTermTitle;
@property (nonatomic, strong) UILabel *loanTermSubtitle;

@property (nonatomic, strong) UIView *loanInterestRateView;
@property (nonatomic, strong) UILabel *loanInterestRateTitle;
@property (nonatomic, strong) UILabel *loanInterestRateSubtitle;

@property (nonatomic, strong) UILabel *monthlyPayment;
@property (nonatomic, strong) UIButton *detailButton;

@end

@implementation CollectViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CollectViewCellID";
    CollectViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CollectViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    self.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.bgView = [UIView new];
    self.bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0, 2);
    self.bgView.layer.shadowOpacity = 0.1;
    self.bgView.layer.shadowRadius = 3;
    self.bgView.layer.masksToBounds = NO;
    self.bgView.addTo(self.contentView).bgColor([UIColor whiteColor]).borderRadius(8).makeCons(^{
        make.left.equal.view(self.contentView).constants(15);
        make.right.equal.view(self.contentView).constants(-15);
        make.top.equal.view(self.contentView).constants(10);
        make.bottom.equal.view(self.contentView).constants(-10);
    });
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.addTo(self.bgView).str(@"商业贷款 - 等额本息").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.top.equal.view(self.bgView).constants(15);
    });
    
    self.timeLabel = [UILabel new];
    self.timeLabel.textColor = [Color textSub];
    self.timeLabel.addTo(self.bgView).str(@"2023-10-11 14:30").fnt(14).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.top.equal.view(self.titleLabel).bottom.constants(8);
    });
    
    self.loanAmountView = [UIView new];
    self.loanAmountView.addTo(self.bgView).bgColor([UIColor whiteColor]).makeCons(^{
        make.left.equal.view(self.bgView);
        make.top.equal.view(self.timeLabel).bottom.constants(0);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.333);
        make.height.equal.constants(70);
    });
    
    self.loanAmountTitle = [UILabel new];
    self.loanAmountTitle.textColor = [Color textSub];
    self.loanAmountTitle.addTo(self.loanAmountView).str(@"贷款金额").fnt(14).makeCons(^{
        make.centerX.equal.view(self.loanAmountView);
        make.top.equal.view(self.loanAmountView).constants(15);
    });
    
    self.loanAmountSubtitle = [UILabel new];
    self.loanAmountSubtitle.textColor = [Color textBlank];
    self.loanAmountSubtitle.addTo(self.loanAmountView).str(@"100万").fnt(14).makeCons(^{
        make.centerX.equal.view(self.loanAmountView);
        make.top.equal.view(self.loanAmountTitle).bottom.constants(5);
    });

    self.loanTermView = [UIView new];
    self.loanTermView.addTo(self.bgView).bgColor([UIColor whiteColor]).makeCons(^{
        make.left.equal.view(self.loanAmountView).right.constants(0);
        make.top.equal.view(self.timeLabel).bottom.constants(0);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.333);
        make.height.equal.constants(70);
    });

    self.loanTermTitle = [UILabel new];
    self.loanTermTitle.textColor = [Color textSub];
    self.loanTermTitle.addTo(self.loanTermView).str(@"贷款期限").fnt(14).makeCons(^{
        make.centerX.equal.view(self.loanTermView);
        make.top.equal.view(self.loanTermView).constants(15);
    });
    
    self.loanTermSubtitle = [UILabel new];
    self.loanTermSubtitle.textColor = [Color textBlank];
    self.loanTermSubtitle.addTo(self.loanTermView).str(@"30年").fnt(14).makeCons(^{
        make.centerX.equal.view(self.loanTermView);
        make.top.equal.view(self.loanTermTitle).bottom.constants(5);
    });
    
    self.loanInterestRateView = [UIView new];
    self.loanInterestRateView.addTo(self.bgView).bgColor([UIColor whiteColor]).makeCons(^{
        make.left.equal.view(self.loanTermView).right.constants(0);
        make.top.equal.view(self.timeLabel).bottom.constants(0);
        make.width.equal.constants((SCREEN_WIDTH-30)*0.333);
        make.height.equal.constants(70);
    });
    
    self.loanInterestRateTitle = [UILabel new];
    self.loanInterestRateTitle.textColor = [Color textSub];
    self.loanInterestRateTitle.addTo(self.loanInterestRateView).str(@"贷款利率").fnt(14).makeCons(^{
        make.centerX.equal.view(self.loanInterestRateView);
        make.top.equal.view(self.loanInterestRateView).constants(15);
    });
    
    self.loanInterestRateSubtitle = [UILabel new];
    self.loanInterestRateSubtitle.textColor = [Color textBlank];
    self.loanInterestRateSubtitle.addTo(self.loanInterestRateView).str(@"4.9%").fnt(14).makeCons(^{
        make.centerX.equal.view(self.loanInterestRateView);
        make.top.equal.view(self.loanInterestRateTitle).bottom.constants(5);
    });

    self.monthlyPayment = [UILabel new];
    self.monthlyPayment.attributedText = AttStr(AttStr([self formatNumberString:@"5320"]).fnt([UIFont boldSystemFontOfSize:16]).color([UIColor blackColor]),AttStr(@" 元/月").fnt(14).color([Color textSub]));
    self.monthlyPayment.addTo(self.bgView).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.top.equal.view(self.loanAmountView).bottom.constants(15);
    });
    
    self.detailButton = [UIButton new];
    self.detailButton.lSpace = 5;
    [self.detailButton l_beginAdjustContentWithLContentAdjustType:LContentAdjustImageRightTitleLeft];
    self.detailButton.addTo(self.bgView).img(@"detail_collection").str(@"查看详情").fnt(14).color([UIColor blueColor]).makeCons(^{
        make.right.equal.view(self.bgView).constants(-15);
        make.centerY.equal.view(self.monthlyPayment);
        make.width.equal.constants(90);
        make.height.equal.constants(30);
    });
}

- (NSString *)formatNumberString:(NSString *)numberString {
    // 移除字符串中可能存在的非数字字符（除了负号和小数点）
    NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789.-"] invertedSet];
    NSString *cleanString = [[numberString componentsSeparatedByCharactersInSet:nonDigitCharacterSet] componentsJoinedByString:@""];
    
    // 创建数字格式化器
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSeparator:@","];
    [formatter setGroupingSize:3];
    [formatter setUsesGroupingSeparator:YES];
    
    // 尝试将字符串转换为数字
    NSNumber *number = [formatter numberFromString:cleanString];
    if (number == nil) {
        // 如果转换失败，尝试使用更宽松的格式化器
        formatter.numberStyle = NSNumberFormatterNoStyle;
        number = [formatter numberFromString:cleanString];
    }
    
    if (number) {
        // 设置回十进制样式并格式化
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        return [formatter stringFromNumber:number];
    } else {
        // 如果仍然无法转换，返回原始字符串或错误处理
        return numberString;
    }
}

@end
