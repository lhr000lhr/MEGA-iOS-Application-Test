//
//  MGTransactionViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/19.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionViewModel.h"
#import "MGAPIManager.h"

@implementation MGTransactionViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.createDate = [NSDate date];
        @weakify(self);

    }
    return self;
}

- (instancetype)initWithTransaction:(MGTransaction *)transaction {
    self = [self init];
    if (self) {
        
        self.transaction = transaction;
        self.amount = @(transaction.amount).stringValue;
        self.currencyType = transaction.currencyType;
        self.createDate = transaction.createDate;
        self.selectedCategoryName = transaction.category.name;
        
    }
    
    
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
        BOOL result = amount.doubleValue > 0 && createDate && selectedCategoryName;
        
        return @(result);
    }];
}

@end
