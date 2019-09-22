//
//  MGCategoryTableViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGCategoryCellViewModel : RVMViewModel

@property (strong, nonatomic) MGCategory *category;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) double exchangeAmount;
@property (strong, nonatomic, readonly) NSString *detailText;

@end

NS_ASSUME_NONNULL_END
