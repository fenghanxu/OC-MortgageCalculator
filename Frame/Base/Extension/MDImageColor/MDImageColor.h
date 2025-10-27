//
//  MDImageColor.h
//  Moods
//
//  Created by EDY on 2021/8/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageColorModel.h"

@interface MDImageColor : NSObject
+(ImageColorModel*)mostColor:(UIImage*)image;
@end

