//
//  MGCategoryTableViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryCellViewModel.h"
#import "MGExchangeRate.h"
#import "MGToolUtilities.h"
#import "MGCategory.h"

@implementation MGCategoryCellViewModel

#pragma mark - getters

- (double)exchangeAmount {
    
    return [MGToolUtilities convertUSDToNZD:self.category.budget];
}

- (NSString *)detailText {
    
    
    NSString *text = [NSString stringWithFormat:@"budget: %@ %0.2lf",
                      [MGToolUtilities convertStringWithCurrencyType:self.category.currencyType],
                      self.category.budget
                      ];
    
    if (self.category.currencyType == MGCurrencyTypeUSD) {
        text = [NSString stringWithFormat:@"%@  NZD %0.4lf",text, self.exchangeAmount];
    }
    
    return text;
}


@end
