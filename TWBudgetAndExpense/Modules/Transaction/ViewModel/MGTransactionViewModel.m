//
//  MGTransactionViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/19.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionViewModel.h"

@implementation MGTransactionViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _transaction = [[MGTransaction alloc] init];
    }
    
    return self;
}

@end
