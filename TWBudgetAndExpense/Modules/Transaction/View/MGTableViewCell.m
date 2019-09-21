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
    self.textLabel.text = transaction.category.name;
    
    self.detailTextLabel.text = [NSString stringWithFormat:@"amount: %@ %0.2lf", [MGToolUtilities convertStringWithCurrencyType:transaction.currencyType], transaction.amount];
    self.backgroundColor = [UIColor colorWithHexString:transaction.category.colorHex];
}

@end
