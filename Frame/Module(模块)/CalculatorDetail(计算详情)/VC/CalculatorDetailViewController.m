//
//  CalculatorDetailViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/11/4.
//

#import "CalculatorDetailViewController.h"
#import "CalculatorDetailCell.h"
#import "CalculatorDetailHeaderView.h"
#import "RepaymentDetailSubView.h"

@interface CalculatorDetailViewController ()

@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) UIView        *containerView;

@property (nonatomic, strong) UIView        *resultView;
@property (nonatomic, strong) UILabel       *resultTitleLabel;
@property (nonatomic, strong) UILabel       *resultSubTitleLabel;
@property (nonatomic, strong) UILabel       *repaymentLabel;

@property (nonatomic, strong) UIView        *totalInterestView;
@property (nonatomic, strong) UILabel       *totalInterestLabel;
@property (nonatomic, strong) UILabel       *totalInterestSubLabel;

@property (nonatomic, strong) UIView        *lumpSumView;
@property (nonatomic, strong) UILabel       *lumpSumLabel;
@property (nonatomic, strong) UILabel       *lumpSumSubLabel;

@property (nonatomic, strong) UIView        *loanInformationView;
@property (nonatomic, strong) UILabel       *loanInformationLabel;
@property (nonatomic, strong) UILabel       *loanAmountLabel;
@property (nonatomic, strong) UILabel       *loanTermLabel;
@property (nonatomic, strong) UILabel       *loanInterestRateLabel;
@property (nonatomic, strong) UILabel       *loanMethodLabel;

@property (nonatomic, strong) UILabel       *loanAmountSubLabel;
@property (nonatomic, strong) UILabel       *loanTermSubLabel;
@property (nonatomic, strong) UILabel       *loanInterestRateSubLabel;
@property (nonatomic, strong) UILabel       *loanMethodSubLabel;

@property (nonatomic, strong) UIView        *repaymentDetailView;
@property (nonatomic, strong) UILabel       *repaymentDetailLabel;

@property (nonatomic, strong) CalculatorDetailHeaderView *repaymentDetailHeaderView;

@property (nonatomic, assign) NSInteger     number;


@end

@implementation CalculatorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"计算结果";
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    
    self.number = 5;
    
    self.scrollView = [UIScrollView new];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + 10);
    self.scrollView.addTo(self.view).makeCons(^{
        make.left.top.right.bottom.equal.view(self.view);
    });

    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.containerView.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
    [self.scrollView addSubview:self.containerView];
    
    self.resultView = [UIView new];
    self.resultView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.resultView.layer.shadowOffset = CGSizeMake(0, 2);
    self.resultView.layer.shadowOpacity = 0.1;
    self.resultView.layer.shadowRadius = 3;
    self.resultView.layer.masksToBounds = NO;
    [self.resultView az_setGradientBackgroundWithColors:@[[UIColor colorWithHexString:@"0x228B22"], [Color theme]] locations:nil startPoint:CGPointMake(1, 0) endPoint:CGPointMake(0, 1)];
    self.resultView.addTo(self.containerView).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.containerView).constants(5);
        make.height.equal.constants(200);
    });
    
    self.resultTitleLabel = [UILabel new];
    self.resultTitleLabel.textColor = [UIColor whiteColor];
    self.resultTitleLabel.addTo(self.resultView).str(@"等额本息还款").fnt(14).makeCons(^{
        make.left.equal.view(self.resultView).constants(15);
        make.top.equal.view(self.resultView).constants(15);
    });
    
    self.resultSubTitleLabel = [UILabel new];
    self.resultSubTitleLabel.textColor = [UIColor whiteColor];
    self.resultSubTitleLabel.addTo(self.resultView).str(@"每月还款").fnt(14).makeCons(^{
        make.centerX.equal.view(self.resultView);
        make.top.equal.view(self.resultTitleLabel).bottom.constants(25);
    });
    
    self.repaymentLabel = [UILabel new];
    id a = AttStr([self formatNumberString:@"5320"]).fnt([UIFont boldSystemFontOfSize:24]).color([UIColor whiteColor]);
    id b = AttStr(@"元/月").fnt(14).color([UIColor whiteColor]);
    self.repaymentLabel.attributedText = AttStr(a,b);
    self.repaymentLabel.textColor = [UIColor whiteColor];
    self.repaymentLabel.addTo(self.resultView).makeCons(^{
        make.centerX.equal.view(self.resultView);
        make.top.equal.view(self.resultSubTitleLabel).bottom.constants(10);
    });
    
    self.totalInterestView = [UIView new];
    self.totalInterestView.addTo(self.resultView).makeCons(^{
        make.width.equal.constants((SCREEN_WIDTH-30)*0.5);
        make.height.equal.constants(70);
        make.left.bottom.equal.view(self.resultView);
    });
    
    self.totalInterestLabel = [UILabel new];
    self.totalInterestLabel.textColor = [UIColor whiteColor];
    self.totalInterestLabel.addTo(self.totalInterestView).str(@"总利息").fnt(14).makeCons(^{
        make.top.equal.view(self.totalInterestView);
        make.centerX.equal.view(self.totalInterestView);
    });
    
    self.totalInterestSubLabel = [UILabel new];
    self.totalInterestSubLabel.textColor = [UIColor whiteColor];
    self.totalInterestSubLabel.addTo(self.totalInterestView).str(@"91.05万").fnt([UIFont boldSystemFontOfSize:18]).makeCons(^{
        make.top.equal.view(self.totalInterestLabel).bottom.constants(5);
        make.centerX.equal.view(self.totalInterestView);
    });

    self.lumpSumView = [UIView new];
    self.lumpSumView.addTo(self.resultView).makeCons(^{
        make.width.equal.constants((SCREEN_WIDTH-30)*0.5);
        make.height.equal.constants(70);
        make.right.bottom.equal.view(self.resultView);
    });
    
    self.lumpSumLabel = [UILabel new];
    self.lumpSumLabel.textColor = [UIColor whiteColor];
    self.lumpSumLabel.addTo(self.lumpSumView).str(@"还款总额").fnt(14).makeCons(^{
        make.top.equal.view(self.lumpSumView);
        make.centerX.equal.view(self.lumpSumView);
    });
    
    self.lumpSumSubLabel = [UILabel new];
    self.lumpSumSubLabel.textColor = [UIColor whiteColor];
    self.lumpSumSubLabel.addTo(self.lumpSumView).str(@"191.05万").fnt([UIFont boldSystemFontOfSize:18]).makeCons(^{
        make.top.equal.view(self.lumpSumLabel).bottom.constants(5);
        make.centerX.equal.view(self.lumpSumView);
    });
    
    self.loanInformationView = [UIView new];
    self.loanInformationView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loanInformationView.layer.shadowOffset = CGSizeMake(0, 2);
    self.loanInformationView.layer.shadowOpacity = 0.1;
    self.loanInformationView.layer.shadowRadius = 3;
    self.loanInformationView.layer.masksToBounds = NO;
    self.loanInformationView.addTo(self.containerView).bgColor([UIColor whiteColor]).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.resultView).bottom.constants(15);
        make.height.equal.constants(180);
    });
    
    self.loanInformationLabel = [UILabel new];
    self.loanInformationLabel.textColor = [Color textBlank];
    self.loanInformationLabel.addTo(self.loanInformationView).str(@"贷款信息").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.loanInformationView).constants(15);
        make.top.equal.view(self.loanInformationView).constants(20);
    });
    
    self.loanAmountLabel = [UILabel new];
    self.loanAmountLabel.textColor = [Color textSub];
    self.loanAmountLabel.addTo(self.loanInformationView).str(@"贷款金额").fnt(14).makeCons(^{
        make.left.equal.view(self.loanInformationView).constants(15);
        make.top.equal.view(self.loanInformationLabel).bottom.constants(20);
    });
    
    self.loanTermLabel = [UILabel new];
    self.loanTermLabel.textColor = [Color textSub];
    self.loanTermLabel.addTo(self.loanInformationView).str(@"贷款期限").fnt(14).makeCons(^{
        make.left.equal.view(self.loanInformationView).constants(15);
        make.top.equal.view(self.loanAmountLabel).bottom.constants(10);
    });
    
    self.loanInterestRateLabel = [UILabel new];
    self.loanInterestRateLabel.textColor = [Color textSub];
    self.loanInterestRateLabel.addTo(self.loanInformationView).str(@"贷款利率").fnt(14).makeCons(^{
        make.left.equal.view(self.loanInformationView).constants(15);
        make.top.equal.view(self.loanTermLabel).bottom.constants(10);
    });
    
    self.loanMethodLabel = [UILabel new];
    self.loanMethodLabel.textColor = [Color textSub];
    self.loanMethodLabel.addTo(self.loanInformationView).str(@"贷款方式").fnt(14).makeCons(^{
        make.left.equal.view(self.loanInformationView).constants(15);
        make.top.equal.view(self.loanInterestRateLabel).bottom.constants(10);
    });
    
    self.loanAmountSubLabel = [UILabel new];
    self.loanAmountSubLabel.textColor = [Color textBlank];
    self.loanAmountSubLabel.addTo(self.loanInformationView).str(@"100万").fnt([UIFont boldSystemFontOfSize:14]).rightAlignment.makeCons(^{
        make.right.equal.view(self.loanInformationView).constants(-15);
        make.top.equal.view(self.loanInformationLabel).bottom.constants(20);
    });
    
    self.loanTermSubLabel = [UILabel new];
    self.loanTermSubLabel.textColor = [Color textBlank];
    self.loanTermSubLabel.addTo(self.loanInformationView).str(@"30年(360期)").fnt([UIFont boldSystemFontOfSize:14]).rightAlignment.makeCons(^{
        make.right.equal.view(self.loanInformationView).constants(-15);
        make.top.equal.view(self.loanAmountSubLabel).bottom.constants(10);
    });
    
    self.loanInterestRateSubLabel = [UILabel new];
    self.loanInterestRateSubLabel.textColor = [Color textBlank];
    self.loanInterestRateSubLabel.addTo(self.loanInformationView).str(@"4.90%").fnt([UIFont boldSystemFontOfSize:14]).rightAlignment.makeCons(^{
        make.right.equal.view(self.loanInformationView).constants(-15);
        make.top.equal.view(self.loanTermSubLabel).bottom.constants(10);
    });

    self.loanMethodSubLabel = [UILabel new];
    self.loanMethodSubLabel.textColor = [Color textBlank];
    self.loanMethodSubLabel.addTo(self.loanInformationView).str(@"等额本息").fnt([UIFont boldSystemFontOfSize:14]).rightAlignment.makeCons(^{
        make.right.equal.view(self.loanInformationView).constants(-15);
        make.top.equal.view(self.loanInterestRateSubLabel).bottom.constants(10);
    });
    
    self.repaymentDetailView = [UIView new];
    self.repaymentDetailView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.repaymentDetailView.layer.shadowOffset = CGSizeMake(0, 2);
    self.repaymentDetailView.layer.shadowOpacity = 0.1;
    self.repaymentDetailView.layer.shadowRadius = 3;
    self.repaymentDetailView.layer.masksToBounds = NO;
    self.repaymentDetailView.addTo(self.containerView).bgColor([UIColor whiteColor]).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.loanInformationView).bottom.constants(15);
        make.height.equal.constants(112+self.number*44);
    });
    
    self.repaymentDetailLabel = [UILabel new];
    self.repaymentDetailLabel.textColor = [Color textBlank];
    self.repaymentDetailLabel.addTo(self.repaymentDetailView).str(@"还款明细").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.repaymentDetailView).constants(15);
        make.top.equal.view(self.repaymentDetailView).constants(20);
    });

    self.repaymentDetailHeaderView = [CalculatorDetailHeaderView new];
    self.repaymentDetailHeaderView.addTo(self.repaymentDetailView).makeCons(^{
        make.left.right.equal.view(self.repaymentDetailView);
        make.top.equal.view(self.repaymentDetailLabel).bottom.constants(15);
        make.height.equal.constants(44);
    });
    
    UIView *lastView = self.repaymentDetailHeaderView;
    for (NSInteger i = 0; i < self.number; i++) {
        RepaymentDetailSubView *subView = [RepaymentDetailSubView new];

        subView.addTo(self.repaymentDetailView).makeCons(^{
            make.left.right.equal.view(self.repaymentDetailView);
            make.top.equal.view(lastView).bottom.constants(0);
            make.height.equal.constants(44);
        });
        
        lastView = subView;
    }
  
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

