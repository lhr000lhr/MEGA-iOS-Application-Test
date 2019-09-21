//
//  MGTableViewCell.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTableViewCell.h"
#import "MGToolUtilities.h"
#import "MGTransaction.h"

@implementation MGTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithViewModel:(MGTransactionCellViewModel *)viewModel {
    
    MGTransaction *transaction = viewModel.transaction;

    UIColor *backgroundColor = transaction.category.colorHex ? [UIColor colorWithHexString:transaction.category.colorHex]  : [UIColor whiteColor];
    UIColor *textColor = [UIColor colorWithContrastingBlackOrWhiteColorOn:backgroundColor isFlat:YES];

    self.textLabel.text = transaction.category.name;
    self.textLabel.textColor = textColor;
    self.detailTextLabel.text =  viewModel.detailText;
    self.detailTextLabel.textColor = textColor;
    self.backgroundColor = backgroundColor;
}

@end
