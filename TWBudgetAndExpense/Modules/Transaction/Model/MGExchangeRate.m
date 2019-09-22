//
//  MGExchangeRate.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGExchangeRate.h"
#import "MGAPIManager.h"
#import "MGExchangeRateModel.h"

@implementation MGExchangeRate

+ (NSDictionary *)defaultPropertyValues {
    
    return @{
             @"rate": @(1.598389)
             };
}

+ (instancetype)sharedExchangeRate {
    static MGExchangeRate *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MGExchangeRate allObjects] lastObject];
        if (!manager) {
            manager = [[MGExchangeRate alloc] init];
            [RLMRealm.defaultRealm transactionWithBlock:^{
                [RLMRealm.defaultRealm addObject:manager];
            }];
        }
        [manager refreshRate];
    });
    return manager;
}

- (void)refreshRate {
    
    [[[MGAPIManager sharedManager] fetchExchangeRate] subscribeNext:^(MGExchangeRateModel *rateModel) {
        
        if (rateModel.success) {
            [RLMRealm.defaultRealm beginWriteTransaction];
            self.rate = [rateModel.quotes doubleValueForKey:@"USDNZD" default:1];
            [RLMRealm.defaultRealm commitWriteTransaction];
            NSLog(@"current rate is %lf",self.rate);
        }
        
        
    }];
    
}

@end
