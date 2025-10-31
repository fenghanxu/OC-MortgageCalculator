//
//  MeViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/10/28.
//

#import "MeViewController.h"

@interface MeViewController ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *containerView;

@property (nonatomic, strong) UIView *loginView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *loginTitleLabel;
@property (nonatomic, strong) UILabel *loginSubTitleLabel;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) UIView *functionView;
@property (nonatomic, strong) UILabel *functionTitleLabel;

@property (nonatomic, strong) UIView *settingView;
@property (nonatomic, strong) UILabel *settingTitleLabel;
@end

@implementation MeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 830);
    self.scrollView.addTo(self.view).makeCons(^{
        make.left.top.right.bottom.equal.view(self.view);
    });

    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.containerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 830);
    [self.scrollView addSubview:self.containerView];
    
    self.loginView = [UIView new];
    [self.loginView az_setGradientBackgroundWithColors:@[[UIColor colorWithHexString:@"0x228B22"], [Color theme]] locations:nil startPoint:CGPointMake(1, 0) endPoint:CGPointMake(0, 1)];
    self.loginView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loginView.layer.shadowOffset = CGSizeMake(0, 2);
    self.loginView.layer.shadowOpacity = 0.1;
    self.loginView.layer.shadowRadius = 3;
    self.loginView.layer.masksToBounds = NO;
    self.loginView.addTo(self.containerView).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.containerView).constants(15);
        make.height.equal.constants(250);
    });

    self.headerImageView = [UIImageView new];
    self.headerImageView.addTo(self.loginView).borderRadius(40).bgColor([[Color randomColor] colorWithAlphaComponent:0.5]).makeCons(^{
        make.centerX.equal.view(self.loginView);
        make.top.equal.view(self.loginView).constants(15);
        make.width.height.constants(80);
    });
    
    self.loginTitleLabel = [UILabel new];
    self.loginTitleLabel.textColor = [UIColor whiteColor];
    self.loginTitleLabel.addTo(self.loginView).str(@"未登录").fnt([UIFont boldSystemFontOfSize:24]).makeCons(^{
        make.centerX.equal.view(self.loginView);
        make.top.equal.view(self.headerImageView).bottom.constants(15);
    });
    
    self.loginSubTitleLabel= [UILabel new];
    self.loginSubTitleLabel.textColor = [UIColor whiteColor];
    self.loginSubTitleLabel.addTo(self.loginView).str(@"登录后可同步计算记录").fnt(14).makeCons(^{
        make.centerX.equal.view(self.loginView);
        make.top.equal.view(self.loginTitleLabel).bottom.constants(15);
    });
    
    self.loginButton = [UIButton new];
    self.loginButton.addTo(self.loginView).str(@"立即登录").color([Color theme]).fnt(14).bgColor([UIColor whiteColor]).borderRadius(18).makeCons(^{
        make.centerX.equal.view(self.loginView);
        make.width.equal.constants(100);
        make.height.equal.constants(36);
        make.top.equal.view(self.loginSubTitleLabel).bottom.constants(15);
    });
    
    self.functionView = [UIView new];
    self.functionView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.functionView.layer.shadowOffset = CGSizeMake(0, 2);
    self.functionView.layer.shadowOpacity = 0.1;
    self.functionView.layer.shadowRadius = 3;
    self.functionView.layer.masksToBounds = NO;
    self.functionView.addTo(self.containerView).bgColor([UIColor whiteColor]).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.loginView).bottom.constants(20);
        make.height.equal.constants(250);
    });
    
    self.functionTitleLabel = [UILabel new];
    self.functionTitleLabel.textColor = [UIColor blackColor];
    self.functionTitleLabel.addTo(self.functionView).str(@"功能导航").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.functionView).constants(15);
        make.top.equal.view(self.functionView).constants(15);
    });
    
    self.settingView = [UIView new];
    self.settingView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.settingView.layer.shadowOffset = CGSizeMake(0, 2);
    self.settingView.layer.shadowOpacity = 0.1;
    self.settingView.layer.shadowRadius = 3;
    self.settingView.layer.masksToBounds = NO;
    self.settingView.addTo(self.containerView).bgColor([UIColor whiteColor]).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.functionView).bottom.constants(20);
        make.height.equal.constants(250);
    });
    
    
    self.settingTitleLabel = [UILabel new];
    self.settingTitleLabel.textColor = [UIColor blackColor];
    self.settingTitleLabel.addTo(self.settingView).str(@"系统设置").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.settingView).constants(15);
        make.top.equal.view(self.settingView).constants(15);
    });

}

@end




