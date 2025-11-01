//
//  LoginViewController.m
//  Frame
//
//  Created by imac on 2025/11/1.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *appIconImageView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UITextField *phoneNumberTextfield;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    
    self.appIconImageView = [UIImageView new];
    self.appIconImageView.addTo(self.view).bgColor([Color randomColor]).borderRadius(50).makeCons(^{
        make.centerX.equal.view(self.view);
        make.top.equal.view(self.view).constants(TOTAL_TOP_HEIGHT(self)+10);
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
        make.top.equal.view(self.appIconImageView).bottom.constants(80);
        make.height.equal.constants(350);
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
    
    self.phoneNumberTextfield = [[UITextField alloc] init];
    self.phoneNumberTextfield.addTo(self.bgView);
    self.phoneNumberTextfield.textColor = [UIColor blackColor];
    self.phoneNumberTextfield.textAlignment = NSTextAlignmentLeft;
    self.phoneNumberTextfield.font = [UIFont systemFontOfSize:14];
    self.phoneNumberTextfield.placeholder = @"请输入手机号码";
    self.phoneNumberTextfield.clearButtonMode = UITextFieldViewModeAlways;//显示本文清空按钮
    self.phoneNumberTextfield.secureTextEntry = YES;//设置编辑框中的内容密码显示
    self.phoneNumberTextfield.keyboardType = UIKeyboardTypeNamePhonePad;
    self.phoneNumberTextfield.layer.borderColor = [Color line].CGColor;//设置边框颜色
    self.phoneNumberTextfield.layer.borderWidth = 1.0;//设置边框宽度
    self.phoneNumberTextfield.layer.cornerRadius = 8.0;//设置边框圆角
    self.phoneNumberTextfield.layer.masksToBounds = YES;//设置边框圆角
    self.phoneNumberTextfield.delegate = self;
    self.phoneNumberTextfield.makeCons(^{
        make.centerX.equal.view(self.bgView);
        make.top.equal.view(self.phoneNumberLabel).bottom.constants(10);
        make.left.equal.view(self.bgView).constants(15);
        make.right.equal.view(self.bgView).constants(-15);
        make.height.equal.constants(40);
    });
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", newText);
    return YES;
}

@end










