//
//  MGExchangeRateModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/20.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGExchangeRateModel : NSObject

@property (assign, nonatomic) BOOL success;
@property (assign, nonatomic) NSTimeInterval timestamp;
@property (copy, nonatomic) NSString *source;
@property (copy, nonatomic) NSDictionary *quotes;

@end

NS_ASSUME_NONNULL_END
