//
//  MGCategory.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MGCurrencyType) {
    MGCurrencyTypeNZD = 1,
    MGCurrencyTypeUSD,
 };

RLM_ARRAY_TYPE(MGCategory)

@interface MGCategory : RLMObject

@property NSString *name;
@property NSString *colorHex;
@property double budget;
@property MGCurrencyType currencyType;

@end

NS_ASSUME_NONNULL_END
