//
//  CalculatorDetailCell.m
//  Frame
//
//  Created by 冯汉栩 on 2025/11/4.
//

#import "CalculatorDetailCell.h"

@interface CalculatorDetailCell()

@end

@implementation CalculatorDetailCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CalculatorDetailCellID";
    CalculatorDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CalculatorDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [Color randomColor];
    
}

@end
