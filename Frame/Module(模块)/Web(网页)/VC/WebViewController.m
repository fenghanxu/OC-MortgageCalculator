//
//  WebViewController.m
//  Frame
//
//  Created by 冯汉栩 on 2025/11/3.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation WebViewController

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.addTo(self.view);
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.scrollView.bounces = NO;
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:self.title withExtension:@"html"];
        [_webView loadRequest:[NSURLRequest requestWithURL:fileURL]];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.webView.makeCons(^{
        make.left.equal.view(self.view);
        make.right.equal.view(self.view);
        make.bottom.equal.view(self.view);
        make.top.equal.view(self.view);
    });
}

@end
