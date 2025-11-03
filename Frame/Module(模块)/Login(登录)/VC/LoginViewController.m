//
//  LoginViewController.m
//  Frame
//
//  Created by imac on 2025/11/1.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ResetViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *appIconImageView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UIView *phoneView;
@property (nonatomic, strong) UIImageView *phoneImageView;
@property (nonatomic, strong) UITextField *phoneNumberTextfield;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UIView *passwordView;
@property (nonatomic, strong) UIImageView *passwordImageView;
@property (nonatomic, strong) UITextField *passwordTextfield;
@property (nonatomic, strong) UIButton *forgetPassword;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel *registerLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.sp_prefersNavigationBarHidden = YES;
    
    self.appIconImageView = [UIImageView new];
    self.appIconImageView.addTo(self.view).img(@"logo").borderRadius(50).makeCons(^{
        make.centerX.equal.view(self.view);
        make.top.equal.view(self.view).constants(TOTAL_TOP_HEIGHT(self));
        make.height.width.equal.constants(100);
    });
    
    self.bgView = [UIView new];
    self.bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0, 2);
    self.bgView.layer.shadowOpacity = 0.1;
    self.bgView.layer.shadowRadius = 3;
    self.bgView.layer.masksToBounds = NO;
    self.bgView.addTo(self.view).bgColor([UIColor whiteColor]).borderRadius(16).makeCons(^{
        make.centerX.equal.view(self.view);
        make.top.equal.view(self.appIconImageView).bottom.constants(40);
        make.height.equal.constants(450);
        make.width.equal.constants(SCREEN_WIDTH-30);
    });
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [Color textBlank];
    self.titleLabel.addTo(self.view).str(@"欢迎登录").fnt([UIFont boldSystemFontOfSize:24]).makeCons(^{
        make.centerX.equal.view(self.bgView);
        make.top.equal.view(self.bgView).constants(30);
    });
    
    self.subtitleLabel = [UILabel new];
    self.subtitleLabel.textColor = [Color nonActivated];
    self.subtitleLabel.addTo(self.view).str(@"请输入账号登录您的账户").fnt(14).makeCons(^{
        make.centerX.equal.view(self.bgView);
        make.top.equal.view(self.titleLabel).bottom.constants(10);
    });
    
    self.phoneNumberLabel = [UILabel new];
    self.phoneNumberLabel.textColor = [Color textBlank];
    self.phoneNumberLabel.addTo(self.bgView).str(@"手机号").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.top.equal.view(self.subtitleLabel).bottom.constants(30);
    });
    
    self.phoneView = [UIView new];
    self.phoneView.addTo(self.bgView).borderRadius(8.0).border(1,[Color line]).makeCons(^{
        make.centerX.equal.view(self.bgView);
        make.top.equal.view(self.phoneNumberLabel).bottom.constants(10);
        make.left.equal.view(self.bgView).constants(15);
        make.right.equal.view(self.bgView).constants(-15);
        make.height.equal.constants(46);
    });
    
    self.phoneImageView = [UIImageView new];
    self.phoneImageView.addTo(self.phoneView).img(@"登录_电话").makeCons(^{
        make.width.height.equal.constants(30);
        make.centerY.equal.view(self.phoneView);
        make.left.view(self.phoneView).constants(10);
    });
 
    self.phoneNumberTextfield = [[UITextField alloc] init];
    self.phoneNumberTextfield.addTo(self.phoneView);
    self.phoneNumberTextfield.textColor = [UIColor blackColor];
    self.phoneNumberTextfield.textAlignment = NSTextAlignmentLeft;
    self.phoneNumberTextfield.font = [UIFont systemFontOfSize:14];
    self.phoneNumberTextfield.placeholder = @"请输入手机号码";
    self.phoneNumberTextfield.clearButtonMode = UITextFieldViewModeAlways;
    self.phoneNumberTextfield.secureTextEntry = YES;
    self.phoneNumberTextfield.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneNumberTextfield.delegate = self;
    self.phoneNumberTextfield.makeCons(^{
        make.centerY.equal.view(self.phoneView);
        make.left.equal.view(self.phoneImageView).right.constants(5);
        make.right.equal.view(self.phoneView);
        make.height.equal.constants(46);
    });
    
    self.passwordLabel = [UILabel new];
    self.passwordLabel.textColor = [Color textBlank];
    self.passwordLabel.addTo(self.bgView).str(@"密码").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.top.equal.view(self.phoneView).bottom.constants(20);
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
    self.passwordTextfield.placeholder = @"请输入手机密码";
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
    
    self.forgetPassword = [UIButton new];
    self.forgetPassword.addTo(self.bgView).str(@"忘记密码?").fnt(14).color([Color theme]).makeCons(^{
        make.right.equal.view(self.passwordTextfield);
        make.top.equal.view(self.passwordTextfield).bottom.constants(5);
        make.height.equal.constants(30);
        make.width.equal.constants(80);
    }).onClick(^{
        [self.navigationController pushViewController:[ResetViewController new] animated:YES];
    });
    
    self.loginButton = [UIButton new];
    self.loginButton.addTo(self.bgView).str(@"登录").fnt([UIFont boldSystemFontOfSize:24]).color([UIColor whiteColor]).bgColor([Color theme]).borderRadius(8.0).makeCons(^{
        make.left.equal.view(self.bgView).constants(15);
        make.right.equal.view(self.bgView).constants(-15);
        make.top.equal.view(self.passwordView).bottom.constants(80);
        make.height.equal.constants(50);
    });
    
    self.registerLabel = [UILabel new];
    self.registerLabel.attributedText = AttStr(AttStr(@"还没有账号? ").fnt(14).color([Color nonActivated]),AttStr(@" 立即注册").fnt(14).color([Color theme]));
    self.registerLabel.addTo(self.view).makeCons(^{
        make.centerX.equal.view(self.view);
        make.top.equal.view(self.bgView).bottom.constants(15);
        make.height.equal.constants(28);
    }).onClick(^{
        [self.navigationController pushViewController:[RegisterViewController new] animated:YES];
    });
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", newText);
    return YES;
}

@end


