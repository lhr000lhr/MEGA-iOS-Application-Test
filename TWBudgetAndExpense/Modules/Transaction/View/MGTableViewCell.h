//
//  MGTableViewCell.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGTransactionCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGTableViewCell : UITableViewCell

- (void)configureWithViewModel:(MGTransactionCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
