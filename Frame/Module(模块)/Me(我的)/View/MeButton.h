//
//  MeButton.h
//  Frame
//
//  Created by imac on 2025/10/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MeButton : UIControl
@property (nonatomic, strong) UIColor *imageColor;
@property (nonatomic,   copy) NSString *imageName;
@property (nonatomic,   copy) NSString *title;
@property (nonatomic, assign) BOOL showArrow;
@property (nonatomic,   copy) NSString *cacheSize;

@end

NS_ASSUME_NONNULL_END
