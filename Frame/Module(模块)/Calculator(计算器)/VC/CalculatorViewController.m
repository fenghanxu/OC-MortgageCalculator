//
//  CalculatorViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/10/28.
//

#import "CalculatorViewController.h"
#import "CalculatorDetailViewController.h"

@interface CalculatorViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIView   *loanMethodView;
@property (nonatomic, strong) UILabel  *loanMethodViewTitle;
@property (nonatomic, strong) UIButton *businessButton;
@property (nonatomic, strong) UIButton *providentFundButton;
@property (nonatomic, strong) UIButton *combinationButton;

@property (nonatomic, strong) UIView   *calculateView;
@property (nonatomic, strong) UILabel  *calculateViewTitle;
@property (nonatomic, strong) UIButton *interestButton;
@property (nonatomic, strong) UIButton *principalButton;
@property (nonatomic, strong) UIButton *inAdvanceButton;

@property (nonatomic, strong) UIView  *loanMessageView;
@property (nonatomic, strong) UILabel *loanMessageTitle;
@property (nonatomic, strong) UILabel *loanAmount;
@property (nonatomic, strong) UILabel *loanAmountUnit;
@property (nonatomic, strong) UITextField *loanAmountTextField;
@property (nonatomic, strong) UISlider *loanAmountSlider;
@property (nonatomic, strong) UILabel  *minSliderLabel;
@property (nonatomic, strong) UILabel  *maxSliderLabel;

@property (nonatomic, strong) UILabel *loanTerm;
@property (nonatomic, strong) UILabel *loanTermUnit;
@property (nonatomic, strong) UITextField *loanTermTextField;
@property (nonatomic, strong) UISlider *loanTermSlider;
@property (nonatomic, strong) UILabel  *minloanTermSliderLabel;
@property (nonatomic, strong) UILabel  *maxloanTermSliderLabel;

@property (nonatomic, strong) UILabel *loanInterestRate;
@property (nonatomic, strong) UILabel *loanInterestRateUnit;
@property (nonatomic, strong) UITextField *loanInterestRateTextField;
@property (nonatomic, strong) UIButton *loanInterestRateButton_0;
@property (nonatomic, strong) UIButton *loanInterestRateButton_1;
@property (nonatomic, strong) UIButton *loanInterestRateButton_2;
@property (nonatomic, strong) UIButton *loanInterestRateButton_3;

@property (nonatomic, strong) UIButton *calculatorButton;
@end

@implementation CalculatorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"计算器";
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];

    self.scrollView = [UIScrollView new];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 1000);
    self.scrollView.addTo(self.view).makeCons(^{
        make.top.equal.view(self.view);
        make.left.right.bottom.equal.view(self.view);
    });

    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.containerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1000);
    [self.scrollView addSubview:self.containerView];
    
    self.loanMethodView = [UIView new];
    self.loanMethodView.backgroundColor = [UIColor whiteColor];
    self.loanMethodView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loanMethodView.layer.shadowOffset = CGSizeMake(0, 2);
    self.loanMethodView.layer.shadowOpacity = 0.1;
    self.loanMethodView.layer.shadowRadius = 3;
    self.loanMethodView.layer.masksToBounds = NO;
    self.loanMethodView.addTo(self.containerView).borderRadius(8).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.top.equal.view(self.containerView).constants(15);
        make.height.equal.constants(115);
        make.width.equal.constants(SCREEN_WIDTH-30);
    });
    
    self.loanMethodViewTitle = [UILabel new];
    self.loanMethodViewTitle.textColor = [Color textBlank];
    self.loanMethodViewTitle.addTo(self.loanMethodView).fnt([UIFont boldSystemFontOfSize:16]).str(@"贷款方式").makeCons(^{
        make.left.equal.view(self.loanMethodView).constants(15);
        make.top.equal.view(self.loanMethodView).constants(20);
    });
    
    self.businessButton = [UIButton new];
    self.businessButton.addTo(self.loanMethodView).str(@"商业贷款").fnt(14).color([Color theme]).bgColor([Color themeWeak]).borderRadius(8).border(1, [Color theme]).makeCons(^{
        make.left.equal.view(self.loanMethodView).constants(15);
        make.width.equal.constants((SCREEN_WIDTH-15*6) * 0.333);
        make.height.equal.constants(40);
        make.top.equal.view(self.loanMethodViewTitle).bottom.constants(15);
    });
    
    self.providentFundButton = [UIButton new];
    self.providentFundButton.addTo(self.loanMethodView).str(@"公积金贷款").fnt(14).color([Color textSub]).bgColor([UIColor whiteColor]).borderRadius(8).border(1, [Color line]).makeCons(^{
        make.left.equal.view(self.businessButton).right.constants(15);
        make.width.equal.constants((SCREEN_WIDTH-15*6) * 0.333);
        make.height.equal.constants(40);
        make.top.equal.view(self.businessButton);
    });
    
    self.combinationButton = [UIButton new];
    self.combinationButton.addTo(self.loanMethodView).str(@"组合贷款").fnt(14).color([Color textSub]).bgColor([UIColor whiteColor]).borderRadius(8).border(1, [Color line]).makeCons(^{
        make.left.equal.view(self.providentFundButton).right.constants(15);
        make.width.equal.constants((SCREEN_WIDTH-15*6) * 0.333);
        make.height.equal.constants(40);
        make.top.equal.view(self.businessButton);
    });
    
    self.calculateView = [UIView new];
    self.calculateView.backgroundColor = [UIColor whiteColor];
    self.calculateView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.calculateView.layer.shadowOffset = CGSizeMake(0, 2);
    self.calculateView.layer.shadowOpacity = 0.1;
    self.calculateView.layer.shadowRadius = 3;
    self.calculateView.layer.masksToBounds = NO;
    self.calculateView.addTo(self.containerView).borderRadius(8).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.top.equal.view(self.loanMethodView).bottom.constants(15);
        make.height.equal.constants(115);
        make.width.equal.constants(SCREEN_WIDTH-30);
    });
    
    self.calculateViewTitle = [UILabel new];
    self.calculateViewTitle.textColor = [Color textBlank];
    self.calculateViewTitle.addTo(self.calculateView).fnt([UIFont boldSystemFontOfSize:16]).str(@"计算方式").makeCons(^{
        make.left.equal.view(self.calculateView).constants(15);
        make.top.equal.view(self.calculateView).constants(20);
    });
    
    self.interestButton = [UIButton new];
    self.interestButton.addTo(self.calculateView).str(@"等额本金").fnt(14).color([Color theme]).bgColor([Color themeWeak]).borderRadius(8).border(1, [Color theme]).makeCons(^{
        make.left.equal.view(self.calculateView).constants(15);
        make.width.equal.constants((SCREEN_WIDTH-15*6) * 0.333);
        make.height.equal.constants(40);
        make.top.equal.view(self.calculateViewTitle).bottom.constants(15);
    });
    
    self.principalButton = [UIButton new];
    self.principalButton.addTo(self.calculateView).str(@"等额本金").fnt(14).color([Color textSub]).bgColor([UIColor whiteColor]).borderRadius(8).border(1, [Color line]).makeCons(^{
        make.left.equal.view(self.interestButton).right.constants(15);
        make.width.equal.constants((SCREEN_WIDTH-15*6) * 0.333);
        make.height.equal.constants(40);
        make.top.equal.view(self.interestButton);
    });
    
    self.inAdvanceButton = [UIButton new];
    self.inAdvanceButton.addTo(self.calculateView).str(@"提前还款").fnt(14).color([Color textSub]).bgColor([UIColor whiteColor]).borderRadius(8).border(1, [Color line]).makeCons(^{
        make.left.equal.view(self.principalButton).right.constants(15);
        make.width.equal.constants((SCREEN_WIDTH-15*6) * 0.333);
        make.height.equal.constants(40);
        make.top.equal.view(self.interestButton);
    });
        
    self.loanMessageView = [UIView new];
    self.loanMessageView.backgroundColor = [UIColor whiteColor];
    self.loanMessageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loanMessageView.layer.shadowOffset = CGSizeMake(0, 2);
    self.loanMessageView.layer.shadowOpacity = 0.1;
    self.loanMessageView.layer.shadowRadius = 3;
    self.loanMessageView.layer.masksToBounds = NO;
    self.loanMessageView.addTo(self.containerView).borderRadius(8).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.top.equal.view(self.calculateView).bottom.constants(15);
        make.height.equal.constants(580);
        make.width.equal.constants(SCREEN_WIDTH-30);
    });
    
    self.loanMessageTitle = [UILabel new];
    self.loanMessageTitle.textColor = [Color textBlank];
    self.loanMessageTitle.addTo(self.loanMessageView).fnt([UIFont boldSystemFontOfSize:16]).str(@"贷款信息").makeCons(^{
        make.left.equal.view(self.loanMessageView).constants(15);
        make.top.equal.view(self.loanMessageView).constants(20);
    });
    
    self.loanAmount = [UILabel new];
    self.loanAmount.textColor = [Color textBlank];
    self.loanAmount.addTo(self.loanMessageView).fnt([UIFont boldSystemFontOfSize:14]).str(@"贷款金额").makeCons(^{
        make.left.equal.view(self.loanMessageView).constants(15);
        make.top.equal.view(self.loanMessageTitle).bottom.constants(30);
    });
    
    self.loanAmountUnit = [UILabel new];
    self.loanAmountUnit.textColor = [Color nonActivated];
    self.loanAmountUnit.addTo(self.loanMessageView).fnt([UIFont boldSystemFontOfSize:14]).str(@"万元").makeCons(^{
        make.top.equal.view(self.loanMessageTitle).bottom.constants(30);
        make.right.equal.view(self.loanMessageView).constants(-15);
    });
    
    self.loanAmountTextField = [UITextField new];
    self.loanAmountTextField.textColor = [Color textBlank];
    self.loanAmountTextField.textAlignment = NSTextAlignmentLeft;
    self.loanAmountTextField.font = [UIFont boldSystemFontOfSize:20];
    self.loanAmountTextField.placeholder = @"请输入贷款金额";
    self.loanAmountTextField.delegate = self;
    self.loanAmountTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.loanAmountTextField.layer.borderColor = [Color line].CGColor;
    self.loanAmountTextField.layer.borderWidth = 1.0;
    self.loanAmountTextField.layer.cornerRadius = 8.0;
    self.loanAmountTextField.layer.masksToBounds = YES;
    self.loanAmountTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.loanAmountTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.loanAmountTextField.leftViewMode = UITextFieldViewModeAlways;
    self.loanAmountTextField.tintColor = [Color theme];
    self.loanAmountTextField.addTo(self.loanMessageView).makeCons(^{
        make.top.equal.view(self.loanAmount).bottom.constants(15);
        make.left.equal.view(self.loanMessageView).constants(15);
        make.right.equal.view(self.loanMessageView).constants(-15);
        make.height.equal.constants(50);
    });
    
    self.loanAmountSlider = [[UISlider alloc] init];
    self.loanAmountSlider.addTo(self.loanMessageView);
    self.loanAmountSlider.minimumValue = 1;
    self.loanAmountSlider.maximumValue = 100;
    self.loanAmountSlider.minimumTrackTintColor = [Color theme];
    self.loanAmountSlider.maximumTrackTintColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0];
    [self.loanAmountSlider addTarget:self action:@selector(loanAmountSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    self.loanAmountSlider.makeCons(^{
        make.top.equal.view(self.loanAmountTextField).bottom.constants(20);
        make.centerX.equal.view(self.view);
        make.width.equal.constants(SCREEN_WIDTH-60);
        make.height.equal.constants(10);
    });

    self.minSliderLabel = [UILabel new];
    self.minSliderLabel.textColor = [Color nonActivated];
    self.minSliderLabel.addTo(self.loanAmountSlider).fnt([UIFont boldSystemFontOfSize:14]).str(@"1万元").makeCons(^{
        make.top.equal.view(self.loanAmountSlider).bottom.constants(13);
        make.left.equal.view(self.loanAmountSlider);
    });
    
    self.maxSliderLabel = [UILabel new];
    self.maxSliderLabel.textColor = [Color nonActivated];
    self.maxSliderLabel.addTo(self.loanAmountSlider).fnt([UIFont boldSystemFontOfSize:14]).str(@"100万元").makeCons(^{
        make.top.equal.view(self.loanAmountSlider).bottom.constants(13);
        make.right.equal.view(self.loanAmountSlider);
    });
    

    self.loanTerm = [UILabel new];
    self.loanTerm.textColor = [Color textBlank];
    self.loanTerm.addTo(self.loanMessageView).fnt([UIFont boldSystemFontOfSize:14]).str(@"贷款期限").makeCons(^{
        make.left.equal.view(self.loanMessageView).constants(15);
        make.top.equal.view(self.minSliderLabel).bottom.constants(30);
    });
    
    self.loanTermUnit = [UILabel new];
    self.loanTermUnit.textColor = [Color nonActivated];
    self.loanTermUnit.addTo(self.loanMessageView).fnt([UIFont boldSystemFontOfSize:14]).str(@"年").makeCons(^{
        make.top.equal.view(self.loanTerm);
        make.right.equal.view(self.loanMessageView).constants(-15);
    });
    
    self.loanTermTextField = [UITextField new];
    self.loanTermTextField.textColor = [Color textBlank];
    self.loanTermTextField.textAlignment = NSTextAlignmentLeft;
    self.loanTermTextField.font = [UIFont boldSystemFontOfSize:20];
    self.loanTermTextField.placeholder = @"请输入贷款期限";
    self.loanTermTextField.delegate = self;
    self.loanTermTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.loanTermTextField.layer.borderColor = [Color line].CGColor;
    self.loanTermTextField.layer.borderWidth = 1.0;
    self.loanTermTextField.layer.cornerRadius = 8.0;
    self.loanTermTextField.layer.masksToBounds = YES;
    self.loanTermTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.loanTermTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.loanTermTextField.leftViewMode = UITextFieldViewModeAlways;
    self.loanTermTextField.tintColor = [Color theme];
    self.loanTermTextField.addTo(self.loanMessageView).makeCons(^{
        make.top.equal.view(self.loanTerm).bottom.constants(15);
        make.left.equal.view(self.loanMessageView).constants(15);
        make.right.equal.view(self.loanMessageView).constants(-15);
        make.height.equal.constants(50);
    });
    
    self.loanTermSlider = [[UISlider alloc] init];
    self.loanTermSlider.addTo(self.loanMessageView);
    self.loanTermSlider.minimumValue = 1;
    self.loanTermSlider.maximumValue = 30;
    self.loanTermSlider.minimumTrackTintColor = [Color theme];
    self.loanTermSlider.maximumTrackTintColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0];
    [self.loanTermSlider addTarget:self action:@selector(loanTermSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    self.loanTermSlider.makeCons(^{
        make.top.equal.view(self.loanTermTextField).bottom.constants(20);
        make.centerX.equal.view(self.view);
        make.width.equal.constants(SCREEN_WIDTH-60);
        make.height.equal.constants(10);
    });

    self.minloanTermSliderLabel = [UILabel new];
    self.minloanTermSliderLabel.textColor = [Color nonActivated];
    self.minloanTermSliderLabel.addTo(self.loanTermSlider).fnt([UIFont boldSystemFontOfSize:14]).str(@"1年").makeCons(^{
        make.top.equal.view(self.loanTermSlider).bottom.constants(15);
        make.left.equal.view(self.loanTermSlider);
    });
    
    self.maxloanTermSliderLabel = [UILabel new];
    self.maxloanTermSliderLabel.textColor = [Color nonActivated];
    self.maxloanTermSliderLabel.addTo(self.loanTermSlider).fnt([UIFont boldSystemFontOfSize:14]).str(@"30年").makeCons(^{
        make.top.equal.view(self.loanTermSlider).bottom.constants(15);
        make.right.equal.view(self.loanTermSlider);
    });
    

    
    self.loanInterestRate = [UILabel new];
    self.loanInterestRate.textColor = [Color textBlank];
    self.loanInterestRate.addTo(self.loanMessageView).fnt([UIFont boldSystemFontOfSize:14]).str(@"贷款利率").makeCons(^{
        make.left.equal.view(self.loanMessageView).constants(15);
        make.top.equal.view(self.minloanTermSliderLabel).bottom.constants(30);
    });
    
    self.loanInterestRateUnit = [UILabel new];
    self.loanInterestRateUnit.textColor = [Color nonActivated];
    self.loanInterestRateUnit.addTo(self.loanMessageView).fnt([UIFont boldSystemFontOfSize:14]).str(@"年").makeCons(^{
        make.top.equal.view(self.loanInterestRate);
        make.right.equal.view(self.loanMessageView).constants(-15);
    });
    
    self.loanInterestRateTextField = [UITextField new];
    self.loanInterestRateTextField.textColor = [Color textBlank];
    self.loanInterestRateTextField.textAlignment = NSTextAlignmentLeft;
    self.loanInterestRateTextField.font = [UIFont boldSystemFontOfSize:20];
    self.loanInterestRateTextField.placeholder = @"请输入贷款利率";
    self.loanInterestRateTextField.delegate = self;
    self.loanInterestRateTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.loanInterestRateTextField.layer.borderColor = [Color line].CGColor;
    self.loanInterestRateTextField.layer.borderWidth = 1.0;
    self.loanInterestRateTextField.layer.cornerRadius = 8.0;
    self.loanInterestRateTextField.layer.masksToBounds = YES;
    self.loanInterestRateTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.loanInterestRateTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.loanInterestRateTextField.leftViewMode = UITextFieldViewModeAlways;
    self.loanInterestRateTextField.tintColor = [Color theme];
    self.loanInterestRateTextField.addTo(self.loanMessageView).makeCons(^{
        make.top.equal.view(self.loanInterestRate).bottom.constants(15);
        make.left.equal.view(self.loanMessageView).constants(15);
        make.right.equal.view(self.loanMessageView).constants(-15);
        make.height.equal.constants(50);
    });
    
    self.loanInterestRateButton_0 = [UIButton new];
    self.loanInterestRateButton_0.addTo(self.loanMessageView).str(@"2.81%").color([Color textSub]).bgColor([Color backgroung]).fnt(12).borderRadius(8).makeCons(^{
        make.top.equal.view(self.loanInterestRateTextField).bottom.constants(10);
        make.left.equal.view(self.loanMessageView).constants(15);
        make.height.equal.constants(36);
        make.width.equal.constants((SCREEN_WIDTH-90)*0.25);
    });
    
    self.loanInterestRateButton_1 = [UIButton new];
    self.loanInterestRateButton_1.addTo(self.loanMessageView).str(@"3.0%").color([Color textSub]).bgColor([Color backgroung]).fnt(12).borderRadius(8).makeCons(^{
        make.top.equal.view(self.loanInterestRateTextField).bottom.constants(10);
        make.left.equal.view(self.loanInterestRateButton_0).right.constants(10);
        make.height.equal.constants(36);
        make.width.equal.constants((SCREEN_WIDTH-90)*0.25);
    });
    
    self.loanInterestRateButton_2 = [UIButton new];
    self.loanInterestRateButton_2.addTo(self.loanMessageView).str(@"3.61%").color([Color textSub]).bgColor([Color backgroung]).fnt(12).borderRadius(8).makeCons(^{
        make.top.equal.view(self.loanInterestRateTextField).bottom.constants(10);
        make.left.equal.view(self.loanInterestRateButton_1).right.constants(10);
        make.height.equal.constants(36);
        make.width.equal.constants((SCREEN_WIDTH-90)*0.25);
    });
    
    self.loanInterestRateButton_3 = [UIButton new];
    self.loanInterestRateButton_3.addTo(self.loanMessageView).str(@"4.26%").color([Color textSub]).bgColor([Color backgroung]).fnt(12).borderRadius(8).makeCons(^{
        make.top.equal.view(self.loanInterestRateTextField).bottom.constants(10);
        make.left.equal.view(self.loanInterestRateButton_2).right.constants(10);
        make.height.equal.constants(36);
        make.width.equal.constants((SCREEN_WIDTH-90)*0.25);
    });
    
    self.calculatorButton = [UIButton new];
    self.calculatorButton.addTo(self.containerView).str(@"开始计算").color([UIColor whiteColor]).bgColor([Color theme]).fnt([UIFont boldSystemFontOfSize:18]).borderRadius(16).makeCons(^{
        make.top.equal.view(self.loanMessageView).bottom.constants(40);
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.height.equal.constants(60);
    }).onClick(^{
        [self.navigationController pushViewController:[CalculatorDetailViewController new] animated:YES];
    });
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", newText);
    return YES;
}

// MARK: - 播放进度
- (void)loanAmountSliderValueChange:(UISlider *)sender {
    // 获取当前滑块的值（浮点数）
    float currentValue = sender.value;
    // 四舍五入到整数
    int roundedValue = (int)roundf(currentValue);
    // 确保值在 1-100 范围内
    roundedValue = MAX(1, MIN(100, roundedValue));
    // 更新UI显示
     self.loanAmountTextField.text = [NSString stringWithFormat:@"%d", roundedValue];
}

-(void)loanTermSliderValueChange:(UISlider *)sender {
    // 获取当前滑块的值（浮点数）
    float currentValue = sender.value;
    // 四舍五入到整数
    int roundedValue = (int)roundf(currentValue);
    // 确保值在 1-100 范围内
    roundedValue = MAX(1, MIN(100, roundedValue));
    // 更新UI显示
     self.loanTermTextField.text = [NSString stringWithFormat:@"%d", roundedValue];
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
