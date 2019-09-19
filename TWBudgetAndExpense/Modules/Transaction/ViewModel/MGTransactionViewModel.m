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
//        _transaction = [[MGTransaction alloc] init];
    }
    
    return self;
}


- (NSArray *)categories {

    NSMutableArray *categories = @[].mutableCopy;
    RLMResults *result = [MGCategory allObjects];
    
    for (MGCategory *catogory in result) {
        [categories addObject:catogory.name];
    }
    return categories.copy;
}

- (RACCommand *)doneButtonCommand {
    
    @weakify(self);
    
    if (!_doneButtonCommand) {
        _doneButtonCommand = [[RACCommand alloc] initWithEnabled:[self checkFormSignal] signalBlock:^RACSignal * (id input) {
            @strongify(self);
            
            self.active = YES;
            
            // (1) Create a Dog object and then set its properties
            
            MGTransaction *newTransaction = [[MGTransaction alloc] init];
            newTransaction.createDate = self.createDate;
            newTransaction.amount = [self.amount doubleValue];
            newTransaction.currencyType = self.currencyType;
            
            [RLMRealm.defaultRealm beginWriteTransaction];
            
            [RLMRealm.defaultRealm addObject:newTransaction];
            
            [RLMRealm.defaultRealm commitWriteTransaction];
            
            if (self.dismissBlock) {
                self.dismissBlock();
            }
            
            
            return [RACSignal empty];
        }];
    }
    
    return _doneButtonCommand;
}

- (RACSignal*)checkFormSignal {
    
    RACSignal *amountSignal = RACObserve(self, amount);
    RACSignal *categorySignal = RACObserve(self, selectedCategory);
    
    return [RACSignal combineLatest:@[amountSignal, categorySignal, RACObserve(self, createDate)] reduce:^(NSString *amount, MGCategory *selectedCategory, NSDate *createDate) {
        BOOL result = amount.length > 0 && createDate;
        
        return @(result);
    }];
}

@end
