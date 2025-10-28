//
//  CalculatorViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/10/28.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *monthlyPaymentView;
@property (nonatomic, strong) UILabel *monthlyPaymentTitle;
@property (nonatomic, strong) UILabel *monthlyPaymentNumber;
@property (nonatomic, strong) UILabel *totalRepaymentLabel;
@property (nonatomic, strong) UILabel *payInterestLabel;
@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"计算器";
//    
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
//       NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    
    
    self.scrollView = [UIScrollView new];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(screenWidth, 1000);
    self.scrollView.addTo(self.view).makeCons(^{
        make.left.top.right.bottom.equal.view(self.view);
    });

    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.containerView.frame = CGRectMake(0, 0, screenWidth, 1000);
    [self.scrollView addSubview:self.containerView];
    
    self.monthlyPaymentView = [UIView new];
    [self.monthlyPaymentView az_setGradientBackgroundWithColors:@[[UIColor colorWithHexString:@"0x228B22"], [Color theme]] locations:nil startPoint:CGPointMake(1, 0) endPoint:CGPointMake(0, 1)];
    self.monthlyPaymentView.addTo(self.containerView).borderRadius(8).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.containerView).constants(15);
        make.height.equal.constants(120);
    });
    
    self.monthlyPaymentTitle = [UILabel new];
    self.monthlyPaymentTitle.textColor = [UIColor colorWithHexString:@"0XD3E0FB"];
    self.monthlyPaymentTitle.addTo(self.containerView).str(@"月供参考").fnt(14).makeCons(^{
        make.left.equal.view(self.monthlyPaymentView).constants(15);
        make.top.equal.view(self.monthlyPaymentView).constants(15);
    });
    
    id monthlyPaymentNumberA = AttStr(@"¥12345").color([UIColor whiteColor]).fnt([UIFont boldSystemFontOfSize:24]);
    id monthlyPaymentNumberB = AttStr(@"/月").color([UIColor colorWithHexString:@"0XD3E0FB"]).fnt(14);
    self.monthlyPaymentNumber = [UILabel new];
    self.monthlyPaymentNumber .attributedText = AttStr(monthlyPaymentNumberA,monthlyPaymentNumberB);
    self.monthlyPaymentNumber.addTo(self.containerView).makeCons(^{
        make.left.equal.view(self.monthlyPaymentView).constants(15);
        make.top.equal.view(self.monthlyPaymentTitle).bottom.constants(15);
    });
    
    id totalRepaymentLabelA = AttStr(@"还款总额: ").color([UIColor colorWithHexString:@"0XD3E0FB"]).fnt(14);
    id totalRepaymentLabelB = AttStr(@"¥ 2222345").color([UIColor whiteColor]).fnt(14);
    self.totalRepaymentLabel = [UILabel new];
    self.totalRepaymentLabel .attributedText = AttStr(totalRepaymentLabelA,totalRepaymentLabelB);
    self.totalRepaymentLabel.addTo(self.containerView).makeCons(^{
        make.left.equal.view(self.monthlyPaymentView).constants(15);
        make.bottom.equal.view(self.monthlyPaymentView).bottom.constants(-15);
    });
    
    id payInterestLabelA = AttStr(@"还款总额: ").color([UIColor colorWithHexString:@"0XD3E0FB"]).fnt(14);
    id payInterestLabelB = AttStr(@"¥ ").color([UIColor whiteColor]).fnt(14);
    id payInterestLabelC = AttStr([self formatNumberString:@"772345"]).color([UIColor whiteColor]).fnt(14);
    self.payInterestLabel = [UILabel new];
    self.payInterestLabel .attributedText = AttStr(payInterestLabelA,payInterestLabelB,payInterestLabelC);
    self.payInterestLabel.addTo(self.containerView).makeCons(^{
        make.right.equal.view(self.monthlyPaymentView).constants(-15);
        make.bottom.equal.view(self.monthlyPaymentView).bottom.constants(-15);
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






