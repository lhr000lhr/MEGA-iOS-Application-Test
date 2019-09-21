//
//  MGTransactionCellViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionCellViewModel.h"
#import "MGExchangeRate.h"
#import "MGToolUtilities.h"
#import "MGCategory.h"

@implementation MGTransactionCellViewModel

#pragma mark - getters

- (double)exchangeAmount {
    
    MGExchangeRate *exchangeRate = [[MGExchangeRate allObjects] lastObject];
    if (!exchangeRate) {
        exchangeRate = [[MGExchangeRate alloc] init];
    }
    return exchangeRate.rate * self.transaction.amount;
}

- (NSString *)detailText {
    
    NSString *text = [NSString stringWithFormat:@"amount: %@ %0.2lf",
                                 [MGToolUtilities convertStringWithCurrencyType:self.transaction.currencyType],
                                 self.transaction.amount
                                 ];
    
    if (self.transaction.currencyType == MGCurrencyTypeUSD) {
        text = [NSString stringWithFormat:@"%@  NZD %0.2lf",text, self.exchangeAmount];
    }
    
    return text;
}

@end
