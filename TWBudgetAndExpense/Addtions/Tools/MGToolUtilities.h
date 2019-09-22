//
//  MGToolUtilities.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGCategory.h"


NS_ASSUME_NONNULL_BEGIN

@interface MGToolUtilities : NSObject

+ (NSString *)convertStringWithCurrencyType:(MGCurrencyType)type;

+ (double)convertUSDToNZD:(double)USD;

@end

NS_ASSUME_NONNULL_END
