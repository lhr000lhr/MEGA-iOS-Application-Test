//
//  MGCategoryTableViewCell.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGCategoryCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGCategoryTableViewCell : UITableViewCell

- (void)configureWithViewModel:(MGCategoryCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
