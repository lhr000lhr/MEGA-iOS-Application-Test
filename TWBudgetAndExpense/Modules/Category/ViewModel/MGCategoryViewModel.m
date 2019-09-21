//
//  MGCategoryViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryViewModel.h"

@implementation MGCategoryViewModel


- (RLMResults *)result {
    if (!_result) {
        _result = [MGCategory allObjects];
    }
    return _result;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (instancetype)initWithCategory:(MGCategory *)category {
    
    self = [self init];
    if (self) {
        self.category = category;
        self.budget = category.budget;
        self.name = category.name;
        self.colorHex = category.colorHex;
        self.currencyType = category.currencyType;
    }
    
    return self;
}

#pragma mark - getters

- (NSString *)colorHex {
    if (!_colorHex) {
        _colorHex = [UIColor redColor].hexString;
    }
    return _colorHex;
}

- (RACCommand *)doneButtonCommand {
    
    @weakify(self);

    if (!_doneButtonCommand) {
        _doneButtonCommand = [[RACCommand alloc] initWithEnabled:[self checkFormSignal] signalBlock:^RACSignal * (id input) {
            @strongify(self);

            self.active = YES;

            // (1) Create a MGCategory object and then set its properties
            if (!self.category) {
                MGCategory *newCategory = [[MGCategory alloc] init];
                newCategory.name = self.name;
                newCategory.colorHex = self.colorHex;
                newCategory.currencyType = self.currencyType;
                newCategory.budget = self.budget;
                
                
                [RLMRealm.defaultRealm beginWriteTransaction];
                
                [RLMRealm.defaultRealm addObject:newCategory];
                
                [RLMRealm.defaultRealm commitWriteTransaction];
                
            } else {
                
                [[RLMRealm defaultRealm] transactionWithBlock:^{
                    
                    self.category.name =  self.name;
                    self.category.colorHex = self.colorHex;
                    self.category.budget = self.budget;
                    self.category.currencyType = self.currencyType;

                    
                }];
                
            }
       
            self.dismissBlock();
            
            
            return [RACSignal empty];
        }];
    }
    
    return _doneButtonCommand;
}

- (RACSignal*)checkFormSignal {
    
    RACSignal *nameSignal = RACObserve(self, name);
    RACSignal *colorSignal = RACObserve(self, colorHex);
    
    return [RACSignal combineLatest:@[nameSignal, colorSignal] reduce:^(NSString *name, NSString *color) {
        BOOL result = name.length > 0 && color;
        
        return @(result);
    }];
}



@end
