//
//  MGCategory.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategory.h"
#import "MGTransaction.h"

@implementation MGCategory

+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"transactions" : [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"MGTransaction")
                                                         propertyName:@"category"]
             };
}

- (double)calculatedBudget {
    
    switch (self.currencyType) {
        case MGCurrencyTypeNZD:
            return self.budget;
            break;
            
        case MGCurrencyTypeUSD:
            return [MGToolUtilities convertUSDToNZD:self.budget];
        default:
            return self.budget;
            
            break;
    }
}

- (double)calculatedAmount {
    
    CGFloat amount = 0;

    for (MGTransaction *transaction in self.transactions) {
        amount = amount + transaction.calculatedAmount;
    }
    return amount;
}

- (UIColor *)textColor {
    
    UIColor *textColor = [UIColor blackColor];
    
    if (self.calculatedBudget <= self.calculatedAmount) {
        textColor = [UIColor redColor];
    }
    
    return textColor;
}


@end
