//
//  ImageColorModel.h
//  Moods
//
//  Created by EDY on 2021/8/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageColorModel : NSObject

@property (assign, nonatomic) NSInteger colorCount;

@property (copy, nonatomic) UIColor *color;

@property (assign, nonatomic) float alpha;

@end


