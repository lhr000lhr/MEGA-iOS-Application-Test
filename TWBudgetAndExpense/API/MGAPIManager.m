//
//  MGAPIManager.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGAPIManager.h"
#import <ReactiveCocoa.h>
#import <AFNetworking-RACExtensions/AFHTTPRequestOperationManager+RACSupport.h>
#import "MGExchangeRateModel.h"

@implementation MGAPIManager

+ (instancetype)sharedManager {
    static MGAPIManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrlHttp]];
    });
    return instance;
}

- (RACSignal *)fetchExchangeRate {
 
    NSDictionary *param = @{
                            @"access_key" : @"a8cb6d6c2bfb188ab8b1efd7d2afe6b6",
                            @"currencies" : @"NZD",
                            @"source" : @"USD"
                            };
    return [[self rac_GET:@"/api/live" parameters:param] map:^id(RACTuple *tuple) {
        NSDictionary *response = tuple.first;
        return [MGExchangeRateModel modelWithDictionary:response];

    }];
 
}


@end
