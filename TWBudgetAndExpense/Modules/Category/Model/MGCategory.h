//
//  MGCategory.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RLMObject.h"


@class MGTransaction;

NS_ASSUME_NONNULL_BEGIN

RLM_ARRAY_TYPE(MGTransaction)

typedef NS_ENUM(NSInteger, MGCurrencyType) {
    MGCurrencyTypeNZD = 1,
    MGCurrencyTypeUSD,
 };


@interface MGCategory : RLMObject

@property NSString *name;
@property NSString *colorHex;
@property double budget;
@property MGCurrencyType currencyType;

@property RLMArray<MGTransaction *><MGTransaction> *transactions;

@end

NS_ASSUME_NONNULL_END
