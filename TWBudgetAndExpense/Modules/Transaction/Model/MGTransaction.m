//
//  MGTransaction.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/19.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransaction.h"

@implementation MGTransaction

- (double)calculatedAmount {
    
    switch (self.currencyType) {
        case MGCurrencyTypeNZD:
            return self.amount;
            break;
            
            case MGCurrencyTypeUSD:
            return [MGToolUtilities convertUSDToNZD:self.amount];
        default:
            return self.amount;

            break;
    }
}

@end
