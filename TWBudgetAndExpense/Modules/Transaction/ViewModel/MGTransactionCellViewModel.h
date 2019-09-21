//
//  MGTransactionCellViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGTransactionCellViewModel : RVMViewModel

@property (strong, nonatomic) MGTransaction *transaction;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
