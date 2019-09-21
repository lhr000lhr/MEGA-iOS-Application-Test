//
//  MGToolUtilities.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGToolUtilities.h"

@implementation MGToolUtilities

+ (NSString *)convertStringWithCurrencyType:(MGCurrencyType)type {
    switch (type) {
        case MGCurrencyTypeNZD:
            return @"NZD";
            break;
        case MGCurrencyTypeUSD:
            return @"USD";
        default:
            return @"NZD";
            break;
    }
}

@end
