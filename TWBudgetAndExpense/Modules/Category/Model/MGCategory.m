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


- (UIColor *)textColor {
    
    UIColor *textColor = [UIColor blackColor];
    
    CGFloat amount = 0;
    
    for (MGTransaction *transaction in self.transactions) {
        amount = amount + transaction.calculatedAmount;
    }
    
    if (self.calculatedBudget <= amount) {
        textColor = [UIColor redColor];
    }
    
    return textColor;
}


@end
