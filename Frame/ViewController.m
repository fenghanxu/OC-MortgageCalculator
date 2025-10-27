//
//  ViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2021/2/7.
//

#import "ViewController.h"
#import "Frame-Swift.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed:@"home_search_normal"];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:image
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(buttonTapped)];
    self.navigationItem.rightBarButtonItem = rightItem;

    
}

-(void)buttonTapped {
    NSArray *array = @[@"导出KML",@"导出GEMJSON"];
    
    [SideAssistView showWithTestActionView:win withArray:array withBlock:^(NSString * _Nonnull value) {
        
    }];
}

@end
