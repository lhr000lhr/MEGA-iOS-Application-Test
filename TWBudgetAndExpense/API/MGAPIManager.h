//
//  MGAPIManager.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@class RACSignal;

NS_ASSUME_NONNULL_BEGIN

static NSString *const kBaseUrlHttp = @"http://apilayer.net";

@interface MGAPIManager : AFHTTPRequestOperationManager

+ (instancetype)sharedManager;

- (RACSignal *)fetchExchangeRate;

@end

NS_ASSUME_NONNULL_END
