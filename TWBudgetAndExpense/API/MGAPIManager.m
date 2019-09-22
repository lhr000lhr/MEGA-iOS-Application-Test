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
                            @"access_key" : @"b7ca81d0723947d06b7b07d0d31914c6",
                            @"currencies" : @"NZD",
                            @"source" : @"USD"
                            };
    return [[[self rac_GET:@"/api/live" parameters:param] replayLazily] map:^id(RACTuple *tuple) {
        NSDictionary *response = tuple.first;
        return [MGExchangeRateModel modelWithDictionary:response];

    }];
 
}


@end
