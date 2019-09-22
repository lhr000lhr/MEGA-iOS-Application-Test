//
//  MGTransactionListViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionListViewModel.h"
#import "MGAPIManager.h"
#import "MGExchangeRateModel.h"

@implementation MGTransactionListViewModel


- (instancetype)init {
    self = [super init];
    if (self) {
    
    }

    return self;
}



- (RLMResults *)result {
    if (!_result) {
        _result = [MGTransaction allObjects];
    }
    return _result;
}


@end
