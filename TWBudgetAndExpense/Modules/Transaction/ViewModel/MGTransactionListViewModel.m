//
//  MGTransactionListViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionListViewModel.h"

@implementation MGTransactionListViewModel


- (RLMResults *)result {
    if (!_result) {
        _result = [MGTransaction allObjects];
    }
    return _result;
}


@end
