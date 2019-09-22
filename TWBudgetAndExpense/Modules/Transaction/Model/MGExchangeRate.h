//
//  MGExchangeRate.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGExchangeRate : RLMObject

@property double rate;
@property NSDate *updateDate;

+ (instancetype)sharedExchangeRate;

@end

NS_ASSUME_NONNULL_END
