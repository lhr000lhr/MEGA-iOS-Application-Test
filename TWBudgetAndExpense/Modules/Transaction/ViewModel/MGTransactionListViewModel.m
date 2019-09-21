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
        self.exchangeRate = [[MGExchangeRate allObjects] lastObject];
        if (!self.exchangeRate) {
            self.exchangeRate = [[MGExchangeRate alloc] init];
        }
        
    }
    [self updateExchangeRate];

    return self;
}


- (void)updateExchangeRate {
    [[[MGAPIManager sharedManager] fetchExchangeRate] subscribeNext:^(MGExchangeRateModel *rateModel) {
        
        [RLMRealm.defaultRealm beginWriteTransaction];
        self.exchangeRate.rate = [rateModel.quotes doubleValueForKey:@"USDNZD" default:1];
        [RLMRealm.defaultRealm commitWriteTransaction];
        NSLog(@"current rate is %lf",self.exchangeRate.rate);
        
    }];
}


- (RLMResults *)result {
    if (!_result) {
        _result = [MGTransaction allObjects];
    }
    return _result;
}


@end
