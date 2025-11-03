//
//  ResetViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/11/3.
//

#import "ResetViewController.h"

@interface ResetViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UILabel *passwordSubLabel;
@property (nonatomic, strong) UIView *passwordView;
@property (nonatomic, strong) UIImageView *passwordImageView;
@property (nonatomic, strong) UITextField *passwordTextfield;

@property (nonatomic, strong) UILabel *confirmPasswordLabel;
@property (nonatomic, strong) UIButton *confirmPasswordSubButton;
@property (nonatomic, strong) UIView *confirmPasswordView;
@property (nonatomic, strong) UIImageView *confirmPasswordImageView;
@property (nonatomic, strong) UITextField *confirmPasswordTextfield;

@property (nonatomic, strong) UIButton *confirmButton;
@end

@implementation ResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [Color textBlank];
    self.titleLabel.addTo(self.view).str(@"重置密码").fnt([UIFont systemFontOfSize:24 weight:UIFontWeightHeavy]).makeCons(^{
        make.centerX.equal.view(self.view);
        make.top.equal.view(self.view).constants(80);
    });
    
    self.subtitleLabel = [UILabel new];
    self.subtitleLabel.textColor = [Color nonActivated];
    self.subtitleLabel.addTo(self.view).str(@"请设置您的新密码以继续使用账户").fnt(14).makeCons(^{
        make.centerX.equal.view(self.view);
        make.top.equal.view(self.titleLabel).bottom.constants(10);
    });
    
    self.bgView = [UIView new];
    self.bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0, 2);
    self.bgView.layer.shadowOpacity = 0.1;
    self.bgView.layer.shadowRadius = 3;
    self.bgView.layer.masksToBounds = NO;
    self.bgView.addTo(self.view).bgColor([UIColor whiteColor]).borderRadius(16).makeCons(^{
        make.centerX.equal.view(self.view);
        make.top.equal.view(self.subtitleLabel).bottom.constants(50);
        make.height.equal.constants(250);
        make.width.equal.constants(SCREEN_WIDTH-30);
    });
    
    self.passwordLabel = [UILabel new];
    self.passwordLabel.textColor = [Color textBlank];
    self.passwordLabel.addTo(self.bgView).str(@"设置密码").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.top.equal.view(self.bgView).constants(30);
    });

    self.passwordSubLabel = [UILabel new];
    self.passwordSubLabel.textColor = [UIColor colorWithHexString:@"0x64748B"];
    self.passwordSubLabel.addTo(self.bgView).str(@"至少8个字符").fnt(12).makeCons(^{
        make.right.equal.view(self.bgView).constants(-17);
        make.centerY.equal.view(self.passwordLabel);
    });
    
    self.passwordView = [UIView new];
    self.passwordView.addTo(self.bgView).borderRadius(8.0).border(1,[Color line]).makeCons(^{
        make.centerX.equal.view(self.bgView);
        make.top.equal.view(self.passwordLabel).bottom.constants(10);
        make.left.equal.view(self.bgView).constants(15);
        make.right.equal.view(self.bgView).constants(-15);
        make.height.equal.constants(46);
    });

    self.passwordImageView = [UIImageView new];
    self.passwordImageView.addTo(self.passwordView).img(@"登录_密码").makeCons(^{
        make.width.height.equal.constants(26);
        make.centerY.equal.view(self.passwordView);
        make.left.view(self.passwordView).constants(10);
    });
    
    self.passwordTextfield = [[UITextField alloc] init];
    self.passwordTextfield.addTo(self.passwordView);
    self.passwordTextfield.textColor = [UIColor blackColor];
    self.passwordTextfield.textAlignment = NSTextAlignmentLeft;
    self.passwordTextfield.font = [UIFont systemFontOfSize:14];
    self.passwordTextfield.placeholder = @"请输入6-18位密码";
    self.passwordTextfield.clearButtonMode = UITextFieldViewModeAlways;
    self.passwordTextfield.secureTextEntry = YES;
    self.passwordTextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.passwordTextfield.delegate = self;
    self.passwordTextfield.secureTextEntry = YES;
    self.passwordTextfield.makeCons(^{
        make.centerY.equal.view(self.passwordView);
        make.left.equal.view(self.passwordImageView).right.constants(5);
        make.right.equal.view(self.passwordView);
        make.height.equal.constants(46);
    });
    
    self.confirmPasswordLabel = [UILabel new];
    self.confirmPasswordLabel.textColor = [Color textBlank];
    self.confirmPasswordLabel.addTo(self.bgView).str(@"确认密码").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.top.equal.view(self.passwordTextfield).bottom.constants(30);
    });
    
    self.confirmPasswordSubButton = [UIButton new];
    self.confirmPasswordSubButton.addTo(self.bgView).img(@"重置密码_未打勾").str(@"密码匹配").color([UIColor colorWithHexString:@"0x64748B"]).fnt(12).makeCons(^{
        make.right.equal.view(self.bgView).constants(-17);
        make.centerY.equal.view(self.confirmPasswordLabel);
    });
    
    self.confirmPasswordView = [UIView new];
    self.confirmPasswordView.addTo(self.bgView).borderRadius(8.0).border(1,[Color line]).makeCons(^{
        make.centerX.equal.view(self.bgView);
        make.top.equal.view(self.confirmPasswordLabel).bottom.constants(10);
        make.left.equal.view(self.bgView).constants(15);
        make.right.equal.view(self.bgView).constants(-15);
        make.height.equal.constants(46);
    });

    self.confirmPasswordImageView = [UIImageView new];
    self.confirmPasswordImageView.addTo(self.confirmPasswordView).img(@"登录_密码").makeCons(^{
        make.width.height.equal.constants(26);
        make.centerY.equal.view(self.confirmPasswordView);
        make.left.view(self.confirmPasswordView).constants(10);
    });
    
    self.confirmPasswordTextfield = [[UITextField alloc] init];
    self.confirmPasswordTextfield.addTo(self.confirmPasswordView);
    self.confirmPasswordTextfield.textColor = [UIColor blackColor];
    self.confirmPasswordTextfield.textAlignment = NSTextAlignmentLeft;
    self.confirmPasswordTextfield.font = [UIFont systemFontOfSize:14];
    self.confirmPasswordTextfield.placeholder = @"请再次输入6-18位密码";
    self.confirmPasswordTextfield.clearButtonMode = UITextFieldViewModeAlways;
    self.confirmPasswordTextfield.secureTextEntry = YES;
    self.confirmPasswordTextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.confirmPasswordTextfield.delegate = self;
    self.confirmPasswordTextfield.secureTextEntry = YES;
    self.confirmPasswordTextfield.makeCons(^{
        make.centerY.equal.view(self.confirmPasswordView);
        make.left.equal.view(self.confirmPasswordImageView).right.constants(5);
        make.right.equal.view(self.confirmPasswordView);
        make.height.equal.constants(46);
    });
    
    self.confirmButton = [UIButton new];
    self.confirmButton.addTo(self.view).str(@"确认").fnt([UIFont boldSystemFontOfSize:24]).color([UIColor whiteColor]).bgColor([Color theme]).borderRadius(8.0).makeCons(^{
        make.left.equal.view(self.view).constants(15);
        make.right.equal.view(self.view).constants(-15);
        make.bottom.equal.view(self.view).constants(-TOTAL_BOTTOM_HEIGHT(self)-30);
        make.height.equal.constants(50);
    });
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", newText);
    return YES;
}

@end
