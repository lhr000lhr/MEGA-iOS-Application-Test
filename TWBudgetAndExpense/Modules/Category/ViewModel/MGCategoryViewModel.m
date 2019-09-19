//
//  MGCategoryViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryViewModel.h"

@implementation MGCategoryViewModel

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


@end
