//
//  MGCategoryTableViewCell.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryTableViewCell.h"
#import "MGCategory.h"
#import "MGToolUtilities.h"

@implementation MGCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithViewModel:(MGCategoryCellViewModel *)viewModel {
    
    MGCategory *category = viewModel.category;
    
    
    self.textLabel.text = category.name;
    self.textLabel.textColor = category.textColor;
    
    self.detailTextLabel.text = viewModel.detailText;
    
    self.imageView.image = [UIImage imageWithColor:[UIColor colorWithHexString:category.colorHex]
                                              size:CGSizeMake(30, 30)];
    
}


@end
