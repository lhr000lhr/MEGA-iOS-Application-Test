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

typedef void(^ViewControllerDismissBlock)(void);

@interface MGTransactionViewModel : RVMViewModel

@property (strong, nonatomic) MGCategory *selectedCategory;
@property (strong, nonatomic) NSDate *createDate;
@property (strong, nonatomic) NSString *amount;
@property (assign, nonatomic) MGCurrencyType currencyType;
//@property (strong, nonatomic) RLMResults *result;

@property (strong, nonatomic) RACCommand *doneButtonCommand;
@property (copy, nonatomic) ViewControllerDismissBlock dismissBlock;

- (NSArray *)categories;

@end

NS_ASSUME_NONNULL_END