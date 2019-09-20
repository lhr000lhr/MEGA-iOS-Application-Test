//
//  MGTransactionViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/19.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionViewModel.h"
#import "MGAPIManager.h"
#import "MGExchangeRateModel.h"

@implementation MGTransactionViewModel

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

- (NSArray *)categories {

    NSMutableArray *categories = @[].mutableCopy;
    RLMResults *result = [MGCategory allObjects];
    
    for (MGCategory *catogory in result) {
        [categories addObject:catogory.name];
    }
    return categories.copy;
}

- (void)updateExchangeRate {
    [[[MGAPIManager sharedManager] fetchExchangeRate] subscribeNext:^(MGExchangeRateModel *rateModel) {
        
        [RLMRealm.defaultRealm beginWriteTransaction];
        self.exchangeRate.rate = [rateModel.quotes doubleValueForKey:@"USDNZD" default:1];
        [RLMRealm.defaultRealm commitWriteTransaction];
        NSLog(@"current rate is %lf",self.exchangeRate.rate);
        
    }];
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
            
            RLMResults *results = [MGCategory objectsWhere:[NSString stringWithFormat:@"name = '%@'",self.selectedCategoryName]];
            MGCategory *category = results.firstObject;
            
            [RLMRealm.defaultRealm beginWriteTransaction];
            
            [category.transactions addObject:newTransaction];
            
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
    RACSignal *categorySignal = RACObserve(self, selectedCategoryName);
    
    return [RACSignal combineLatest:@[amountSignal, categorySignal, RACObserve(self, createDate)] reduce:^(NSString *amount, NSString *selectedCategoryName, NSDate *createDate) {
        BOOL result = amount.length > 0 && createDate && selectedCategoryName;
        
        return @(result);
    }];
}

@end
