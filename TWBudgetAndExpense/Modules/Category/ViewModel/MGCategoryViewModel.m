//
//  MGCategoryViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryViewModel.h"

@implementation MGCategoryViewModel

- (MGCategory *)category {
    if (!_category) {
        _category = [[MGCategory alloc] init];
    }
    return _category;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _parent = ({
            MGCategoryParent *parent = MGCategoryParent.allObjects.firstObject;
            if (!parent) {
                MGCategoryParent *parent = [[MGCategoryParent alloc] init];
                RLMRealm *realm = RLMRealm.defaultRealm;
                [realm transactionWithBlock:^{
                    [realm addObject:parent];
                }];
            }
            parent;
        });
    }
    
    return self;
}

- (RACCommand *)doneButtonCommand {
    
    @weakify(self);

    if (!_doneButtonCommand) {
        _doneButtonCommand = [[RACCommand alloc] initWithEnabled:[self checkFormSignal] signalBlock:^RACSignal * (id input) {
            @strongify(self);

            self.active = YES;

            // (1) Create a Dog object and then set its properties
           
            MGCategory *newCategory = [[MGCategory alloc] init];
            newCategory.name = self.category.name;
            newCategory.colorHex = self.category.colorHex;
            newCategory.currencyType = self.category.currencyType;
            newCategory.budget = self.category.budget;
            
            [RLMRealm.defaultRealm beginWriteTransaction];
           
            [self.parent.groups addObject:newCategory];
            
            [RLMRealm.defaultRealm commitWriteTransaction];
            
            self.dismissBlock();
            
            
            return [RACSignal empty];
        }];
    }
    
    return _doneButtonCommand;
}

- (RACSignal*)checkFormSignal {
    
    RACSignal *nameSignal = RACObserve(self.category, name);
    RACSignal *colorSignal = RACObserve(self.category, colorHex);
    
    return [RACSignal combineLatest:@[nameSignal, colorSignal] reduce:^(NSString *name, NSString *color) {
        BOOL result = name.length > 0 && color;
        
        return @(result);
    }];
}


@end
