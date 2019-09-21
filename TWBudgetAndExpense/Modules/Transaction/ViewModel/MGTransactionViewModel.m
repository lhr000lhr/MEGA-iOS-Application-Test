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
        @weakify(self);

//        [RACObserve(self, currencyType) subscribeNext:^(NSNumber *type) {
//            @strongify(self);
//
//           
//            }
//            
//        }];
    }
    [self updateExchangeRate];
    return self;
}




- (NSArray *)categories {

    NSMutableArray *categories = @[@"none"].mutableCopy;
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
            
            RLMResults *results = [MGCategory objectsWhere:[NSString stringWithFormat:@"name = '%@'",self.selectedCategoryName]];
            MGCategory *category = results.firstObject;
            
            // (1) Create a MGTransaction object and then set its properties
            if (!self.transaction) {
                
                MGTransaction *newTransaction = [[MGTransaction alloc] init];
                newTransaction.createDate = self.createDate;
                newTransaction.amount = [self.amount doubleValue];
                newTransaction.currencyType = self.currencyType;
                newTransaction.category = category;
               
                [RLMRealm.defaultRealm beginWriteTransaction];
                
                [RLMRealm.defaultRealm addObject:newTransaction];
                
                [RLMRealm.defaultRealm commitWriteTransaction];
                
            } else {
                
 
                [[RLMRealm defaultRealm] transactionWithBlock:^{
                    
                    self.transaction.createDate = self.createDate;
                    self.transaction.amount = [self.amount doubleValue];
                    self.transaction.currencyType = self.currencyType;
                    
                    self.transaction.category = category;

                }];
                
 
            }
            
            if (self.dismissBlock) {
                self.dismissBlock();
            }
            
            
            return [RACSignal empty];
        }];
    }
    
    return _doneButtonCommand;
}

- (RACSignal *)checkFormSignal {
    
    RACSignal *amountSignal = RACObserve(self, amount);
    RACSignal *categorySignal = RACObserve(self, selectedCategoryName);
    
    return [RACSignal combineLatest:@[amountSignal, categorySignal, RACObserve(self, createDate)] reduce:^(NSString *amount, NSString *selectedCategoryName, NSDate *createDate) {
        BOOL result = amount.length > 0 && createDate && selectedCategoryName;
        
        return @(result);
    }];
}

@end
