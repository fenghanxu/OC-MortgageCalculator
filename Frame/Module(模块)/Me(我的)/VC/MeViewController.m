//
//  MeViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/10/28.
//

#import "MeViewController.h"
#import "MeButton.h"

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
@property (nonatomic, strong) MeButton *collectionButton;
@property (nonatomic, strong) MeButton *historyButton;
@property (nonatomic, strong) MeButton *interestRateButton;
@property (nonatomic, strong) MeButton *knowledgeButton;

@property (nonatomic, strong) UIView *settingView;
@property (nonatomic, strong) UILabel *settingTitleLabel;
@property (nonatomic, strong) MeButton *ousButton;
@property (nonatomic, strong) MeButton *helpButton;
@property (nonatomic, strong) MeButton *policyButton;
@property (nonatomic, strong) MeButton *cacheButton;
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
        make.height.equal.constants(237);
    });
    
    self.functionTitleLabel = [UILabel new];
    self.functionTitleLabel.textColor = [UIColor blackColor];
    self.functionTitleLabel.addTo(self.functionView).str(@"功能导航").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.functionView).constants(15);
        make.top.equal.view(self.functionView).constants(15);
    });
    
    self.collectionButton = [MeButton new];
    self.collectionButton.imageColor = [UIColor colorWithHexString:@"0xFEF9C3"];
    self.collectionButton.title = @"收藏记录";
    self.collectionButton.showArrow = YES;
    self.collectionButton.imageName = @"me_collection";
    self.collectionButton.addTo(self.functionView).makeCons(^{
        make.left.right.equal.view(self.functionView);
        make.height.equal.constants(44);
        make.top.equal.view(self.functionTitleLabel).bottom.constants(15);
    });
    
    self.historyButton = [MeButton new];
    self.historyButton.imageColor = [UIColor colorWithHexString:@"0xDBEAFE"];
    self.historyButton.title = @"历史计算";
    self.historyButton.imageName = @"me_history";
    self.historyButton.showArrow = YES;
    self.historyButton.addTo(self.functionView).makeCons(^{
        make.left.right.equal.view(self.functionView);
        make.height.equal.constants(44);
        make.top.equal.view(self.collectionButton).bottom.constants(0);
    });
    
    self.interestRateButton = [MeButton new];
    self.interestRateButton.imageColor = [UIColor colorWithHexString:@"0xDCFCE7"];
    self.interestRateButton.title = @"最新利率";
    self.interestRateButton.imageName = @"me_interestRate";
    self.interestRateButton.showArrow = YES;
    self.interestRateButton.addTo(self.functionView).makeCons(^{
        make.left.right.equal.view(self.functionView);
        make.height.equal.constants(44);
        make.top.equal.view(self.historyButton).bottom.constants(0);
    });
    
    
    self.knowledgeButton = [MeButton new];
    self.knowledgeButton.imageColor = [UIColor colorWithHexString:@"0xF3E8FF"];
    self.knowledgeButton.title = @"房产知识";
    self.knowledgeButton.imageName = @"me_knowledge";
    self.knowledgeButton.showArrow = YES;
    self.knowledgeButton.addTo(self.functionView).makeCons(^{
        make.left.right.equal.view(self.functionView);
        make.height.equal.constants(44);
        make.top.equal.view(self.interestRateButton).bottom.constants(0);
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
        make.height.equal.constants(237);
    });
    
    self.settingTitleLabel = [UILabel new];
    self.settingTitleLabel.textColor = [UIColor blackColor];
    self.settingTitleLabel.addTo(self.settingView).str(@"系统设置").fnt([UIFont boldSystemFontOfSize:14]).makeCons(^{
        make.left.equal.view(self.settingView).constants(15);
        make.top.equal.view(self.settingView).constants(15);
    });
    
    self.ousButton = [MeButton new];
    self.ousButton.imageColor = [UIColor colorWithHexString:@"0xF3F4F6"];
    self.ousButton.title = @"关于我们";
    self.ousButton.imageName = @"me_our";
    self.ousButton.showArrow = YES;
    self.ousButton.addTo(self.settingView).makeCons(^{
        make.left.right.equal.view(self.settingView);
        make.height.equal.constants(44);
        make.top.equal.view(self.settingTitleLabel).bottom.constants(15);
    });
    
    self.helpButton = [MeButton new];
    self.helpButton.imageColor = [UIColor colorWithHexString:@"0xF3F4F6"];
    self.helpButton.title = @"帮助中心";
    self.helpButton.imageName = @"me_help";
    self.helpButton.showArrow = YES;
    self.helpButton.addTo(self.settingView).makeCons(^{
        make.left.right.equal.view(self.settingView);
        make.height.equal.constants(44);
        make.top.equal.view(self.ousButton).bottom.constants(0);
    });
    
    self.policyButton = [MeButton new];
    self.policyButton.imageColor = [UIColor colorWithHexString:@"0xF3F4F6"];
    self.policyButton.title = @"隐私政策";
    self.policyButton.imageName = @"me_policy";
    self.policyButton.showArrow = YES;
    self.policyButton.addTo(self.settingView).makeCons(^{
        make.left.right.equal.view(self.settingView);
        make.height.equal.constants(44);
        make.top.equal.view(self.helpButton).bottom.constants(0);
    });
    
    
    self.cacheButton = [MeButton new];
    self.cacheButton.imageColor = [UIColor colorWithHexString:@"0xF3F4F6"];
    self.cacheButton.title = @"清除缓存";
    self.cacheButton.showArrow = NO;
    self.cacheButton.imageName = @"me_cache";
    self.cacheButton.addTo(self.settingView).makeCons(^{
        make.left.right.equal.view(self.settingView);
        make.height.equal.constants(44);
        make.top.equal.view(self.policyButton).bottom.constants(0);
    });

}

@end




