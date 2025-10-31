//
//  HistoryHeaderView.m
//  Frame
//
//  Created by 冯汉栩 on 2025/10/30.
//

#import "HistoryHeaderView.h"

@interface HistoryHeaderView()<UITextFieldDelegate>
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *searchImageView;
@property (nonatomic, strong) UITextField *textfield;
@end

@implementation HistoryHeaderView

- (UITextField *)textfield {
    if (!_textfield) {
        _textfield = [[UITextField alloc] init];
        _textfield.addTo(self.bgView);
        _textfield.textColor = [UIColor blackColor];
        _textfield.textAlignment = NSTextAlignmentLeft;
        _textfield.font = [UIFont systemFontOfSize:14];
        _textfield.placeholder = @"请输入搜索内容";
        _textfield.delegate = self;
        _textfield.backgroundColor = [UIColor whiteColor];
        _textfield.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _textfield;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI {
    self.backgroundColor = [UIColor colorWithHexString:@"0xF9FAFB"];
    
    self.bgView = [UIView new];
    self.bgView.addTo(self).bgColor([UIColor whiteColor]).borderRadius(8).border(1,[Color line]).makeCons(^{
        make.top.equal.view(self).constants(10);
        make.left.equal.view(self).constants(15);
        make.right.equal.view(self).constants(-15);
        make.bottom.equal.view(self).constants(-10);
    });
    
    self.searchImageView = [UIImageView new];
    self.searchImageView.addTo(self.bgView).img(@"search_history").makeCons(^{
        make.centerY.equal.view(self.bgView);
        make.left.equal.view(self.bgView).constants(15);
        make.width.height.equal.constants(20);
    });
    
    self.textfield.makeCons(^{
        make.left.equal.view(self.searchImageView).right.constants(15);
        make.top.bottom.right.equal.view(self.bgView);
    });
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@", newText);
    return YES;
}

@end







