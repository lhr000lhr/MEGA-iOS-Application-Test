//
//  MGExpenseChartViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGExpenseChartViewModel : RVMViewModel

@property (strong, nonatomic, readonly) RLMResults <MGCategory *> *result;

@end

NS_ASSUME_NONNULL_END
