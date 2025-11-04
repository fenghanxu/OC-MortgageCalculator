//
//  RegisterViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/11/3.
//

#import "RegisterViewController.h"
#import "WebViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UIView *phoneView;
@property (nonatomic, strong) UIImageView *phoneImageView;
@property (nonatomic, strong) UITextField *phoneNumberTextfield;

@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UIView *passwordView;
@property (nonatomic, strong) UIImageView *passwordImageView;
@property (nonatomic, strong) UITextField *passwordTextfield;

@property (nonatomic, strong) UILabel *confirmPasswordLabel;
@property (nonatomic, strong) UIView *confirmPasswordView;
@property (nonatomic, strong) UIImageView *confirmPasswordImageView;
@property (nonatomic, strong) UITextField *confirmPasswordTextfield;

@property (nonatomic, strong) UIButton *agressButton;
@property (nonatomic, strong) UILabel *protocolLabel_0;
@property (nonatomic, strong) UILabel *protocolLabel_1;
@property (nonatomic, strong) UILabel *protocolLabel_2;
@property (nonatomic, strong) UILabel *protocolLabel_3;

@property (nonatomic, strong) UIButton *registerButton;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];

     self.titleLabel = [UILabel new];
     self.titleLabel.textColor = [Color textBlank];
     self.titleLabel.addTo(self.view).str(@"创建账号").fnt([UIFont systemFontOfSize:24 weight:UIFontWeightHeavy]).makeCons(^{
         make.centerX.equal.view(self.view);
         make.top.equal.view(self.view).constants(10);
     });
     
     self.subtitleLabel = [UILabel new];
     self.subtitleLabel.textColor = [Color nonActivated];
     self.subtitleLabel.addTo(self.view).str(@"编写以下信息完成注册").fnt(14).makeCons(^{
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
         make.top.equal.view(self.subtitleLabel).bottom.constants(30);
         make.height.equal.constants(450);
         make.width.equal.constants(SCREEN_WIDTH-30);
     });
     
     self.phoneNumberLabel = [UILabel new];
     self.phoneNumberLabel.textColor = [Color textBlank];
     self.phoneNumberLabel.addTo(self.bgView).str(@"手机号").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
         make.left.equal.view(self.bgView).constants(15);
         make.top.equal.view(self.bgView).constants(30);
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
     self.passwordLabel.addTo(self.bgView).str(@"设置密码").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
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
         make.top.equal.view(self.passwordTextfield).bottom.constants(20);
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
     
     self.agressButton = [UIButton new];
     [self.agressButton setImage:[UIImage imageNamed:@"选择框-未选中"] forState:UIControlStateNormal];
     [self.agressButton setImage:[UIImage imageNamed:@"选择框-选中"] forState:UIControlStateSelected];
     self.agressButton.addTo(self.bgView).makeCons(^{
         make.top.equal.view(self.confirmPasswordView).bottom.constants(15);
         make.left.equal.view(self.bgView).constants(5);
         make.width.height.equal.constants(18);
     });
    
     self.protocolLabel_0 = [UILabel new];
     self.protocolLabel_0.textColor = [UIColor colorWithHexString:@"0x64748B"];
     self.protocolLabel_0.addTo(self.bgView).str(@"注册即表示同意").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
         make.left.equal.view(self.agressButton).right.constants(5);
         make.centerY.equal.view(self.agressButton);
     });
     
     self.protocolLabel_1 = [UILabel new];
     self.protocolLabel_1.textColor = [Color theme];
     self.protocolLabel_1.addTo(self.bgView).str(@"《用户服务协议》").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
         make.left.equal.view(self.protocolLabel_0).right.constants(0);
         make.centerY.equal.view(self.agressButton);
     }).onClick(^{
        WebViewController *vc = [WebViewController new];
        vc.title = @"用户服务协议";
        [self.navigationController pushViewController:vc animated:YES];
     });
     
     self.protocolLabel_2 = [UILabel new];
     self.protocolLabel_2.textColor = [UIColor colorWithHexString:@"0x64748B"];
     self.protocolLabel_2.addTo(self.bgView).str(@"和").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
         make.left.equal.view(self.protocolLabel_1).right.constants(0);
         make.centerY.equal.view(self.agressButton);
     });
     
     self.protocolLabel_3 = [UILabel new];
     self.protocolLabel_3.textColor = [Color theme];
     self.protocolLabel_3.addTo(self.bgView).str(@"《隐私政策》").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
         make.left.equal.view(self.protocolLabel_2).right.constants(0);
         make.centerY.equal.view(self.agressButton);
     }).onClick(^{
         WebViewController *vc = [WebViewController new];
         vc.title = @"隐私政策";
         [self.navigationController pushViewController:vc animated:YES];
     });
     
     self.registerButton = [UIButton new];
     self.registerButton.addTo(self.bgView).str(@"注册账号").fnt([UIFont boldSystemFontOfSize:24]).color([UIColor whiteColor]).bgColor([Color theme]).borderRadius(8.0).makeCons(^{
         make.left.equal.view(self.bgView).constants(15);
         make.right.equal.view(self.bgView).constants(-15);
         make.bottom.equal.view(self.bgView).constants(-35);
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
