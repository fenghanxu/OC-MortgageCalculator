//
//  MeButton.m
//  Frame
//
//  Created by imac on 2025/10/31.
//

#import "MeButton.h"

@interface MeButton()
@property (nonatomic, strong) UIButton *imageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UIImageView *arrow;
@property (nonatomic, strong) UILabel     *subtitleLabel;
@end

@implementation MeButton

- (void)setImageColor:(UIColor *)imageColor {
    _imageColor = imageColor;
    self.imageView.backgroundColor = imageColor;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    self.imageView.img(imageName);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.str(title);
}

- (void)setShowArrow:(BOOL)showArrow {
    _showArrow = showArrow;
    self.arrow.hidden = !showArrow;
    self.subtitleLabel.hidden = showArrow;
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
    self.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [UIButton new];
    self.imageView.addTo(self).bgColor([Color randomColor]).borderRadius(15).makeCons(^{
        make.centerY.equal.view(self);
        make.left.equal.view(self).constants(30);
        make.width.height.equal.constants(30);
    });
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [Color textTheme];
    self.titleLabel.addTo(self).str(@"收藏记录").fnt(14).makeCons(^{
        make.centerY.equal.view(self);
        make.left.equal.view(self.imageView).right.constants(10);
    });
    
    self.arrow = [UIImageView new];
    self.arrow.addTo(self).img(@"me_arrow").makeCons(^{
        make.centerY.equal.view(self);
        make.right.equal.view(self).constants(-10);
        make.width.height.equal.constants(15);
    });
    
    self.subtitleLabel = [UILabel new];
    self.subtitleLabel.textColor = [Color nonActivated];
    self.subtitleLabel.addTo(self).str(@"0MB").fnt(14).makeCons(^{
        make.centerY.equal.view(self);
        make.right.equal.view(self).constants(-10);
    });
}

@end
