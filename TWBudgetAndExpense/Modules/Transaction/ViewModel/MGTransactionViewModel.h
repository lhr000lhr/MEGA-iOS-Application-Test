//
//  MGTransactionViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/19.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"
#import "MGTransaction.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGTransactionViewModel : RVMViewModel

@property (strong, nonatomic) MGTransaction *transaction;

@end

NS_ASSUME_NONNULL_END
