//
//  MGTransactionListViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"
#import "MGTransaction.h"
#import "MGExchangeRate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGTransactionListViewModel : RVMViewModel

@property (strong, nonatomic) RLMResults *result;

@end

NS_ASSUME_NONNULL_END
