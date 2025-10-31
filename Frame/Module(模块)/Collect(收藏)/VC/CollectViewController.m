//
//  CollectViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/10/28.
//

#import "CollectViewController.h"
#import "CollectViewCell.h"

@interface CollectViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView       *containerView;

@property (nonatomic, strong) UIButton *allCollectionButton;
@property (nonatomic, strong) UIButton *businessLoanButton;
@property (nonatomic, strong) UIButton *providentFundButton;
@property (nonatomic, strong) UIButton *combinationLoanButton;

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation CollectViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.addTo(self.view);
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 200;
        [_tableView registerClass:[CollectViewCell class] forCellReuseIdentifier:@"CollectViewCellID"];
        //为解决tableview  Group的问题
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        _tableView.sectionHeaderHeight = CGFLOAT_MIN;
        _tableView.sectionFooterHeight = CGFLOAT_MIN;
        //为解决ios11 后tableview刷新跳动的问题
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收藏";
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];

    self.scrollView = [UIScrollView new];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH + 50, 70);
    self.scrollView.addTo(self.view).makeCons(^{
        make.top.equal.view(self.view).constants(TOTAL_TOP_HEIGHT(self));
        make.left.right.equal.view(self.view);
        make.height.equal.constants(70);
    });

    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    self.containerView.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
    [self.scrollView addSubview:self.containerView];
    
    
    self.allCollectionButton = [UIButton new];
    self.allCollectionButton.addTo(self.containerView).str(@"全部收藏").fnt(14).color([Color theme]).bgColor([Color themeWeak]).borderRadius(20).makeCons(^{
        make.left.equal.view(self.containerView).constants(15);
        make.centerY.equal.view(self.containerView);
        make.width.equal.constants(90);
        make.height.equal.constants(40);
    });
    
    self.businessLoanButton = [UIButton new];
    self.businessLoanButton.addTo(self.containerView).str(@"商业贷款").fnt(14).color([Color textSub]).bgColor([UIColor whiteColor]).borderRadius(20).border(1, [Color line]).makeCons(^{
        make.left.equal.view(self.allCollectionButton).right.constants(10);
        make.centerY.equal.view(self.containerView);
        make.width.equal.constants(90);
        make.height.equal.constants(40);
    });
    
    self.providentFundButton = [UIButton new];
    self.providentFundButton.addTo(self.containerView).str(@"公积金贷款").fnt(14).color([Color textSub]).bgColor([UIColor whiteColor]).borderRadius(20).border(1, [Color line]).makeCons(^{
        make.left.equal.view(self.businessLoanButton).right.constants(10);
        make.centerY.equal.view(self.containerView);
        make.width.equal.constants(110);
        make.height.equal.constants(40);
    });
    
    
    self.combinationLoanButton = [UIButton new];
    self.combinationLoanButton.addTo(self.containerView).str(@"组合贷款").fnt(14).color([Color textSub]).bgColor([UIColor whiteColor]).borderRadius(20).border(1, [Color line]).makeCons(^{
        make.left.equal.view(self.providentFundButton).right.constants(10);
        make.centerY.equal.view(self.containerView);
        make.width.equal.constants(90);
        make.height.equal.constants(40);
    });
    
    self.tableView.makeCons(^{
        make.top.equal.view(self.scrollView).bottom.constants(0);
        make.left.equal.view(self.view);
        make.right.equal.view(self.view);
        make.bottom.equal.view(self.view);
    });
    
}

#pragma  mark -- UITableViewDataSource, UITableViewDelegate
//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

//cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectViewCell *cell = [CollectViewCell cellWithTableView:tableView];

    return cell;
}

//点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}

@end

