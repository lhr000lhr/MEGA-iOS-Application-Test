//
//  MGExpenseChartViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGExpenseChartViewModel.h"

@implementation MGExpenseChartViewModel

- (RLMResults *)result {
    return [MGCategory allObjects];
}


@end
