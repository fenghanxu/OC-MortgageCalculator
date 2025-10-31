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

@property (nonatomic, strong) UIView *functionView;
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
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 1000);
    self.scrollView.addTo(self.view).makeCons(^{
        make.left.top.right.bottom.equal.view(self.view);
    });

    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.containerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1000);
    [self.scrollView addSubview:self.containerView];
    
    self.loginView = [UIView new];
    [self.loginView az_setGradientBackgroundWithColors:@[[UIColor colorWithHexString:@"0x228B22"], [Color theme]] locations:nil startPoint:CGPointMake(1, 0) endPoint:CGPointMake(0, 1)];
    self.loginView.addTo(self.containerView).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.containerView).constants(15);
        make.height.equal.constants(250);
    });
    
    self.functionView = [UIView new];
    self.functionView.addTo(self.containerView).bgColor([UIColor whiteColor]).borderRadius(16).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.right.equal.view(self.containerView).constants(-15);
        make.top.equal.view(self.loginView).bottom.constants(15);
        make.height.equal.constants(250);
    });

}

@end




