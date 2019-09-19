//
//  MGTransaction.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/19.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RLMObject.h"
#import "MGCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGTransaction : RLMObject

@property MGCategory *category;
@property NSDate *createDate;
@property double amount;
@property MGCurrencyType currencyType;

@end

NS_ASSUME_NONNULL_END
