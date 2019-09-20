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

@interface MGAPIManager : AFHTTPRequestOperationManager

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
