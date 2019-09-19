//
//  MGCategoryViewModel.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryViewModel.h"

@implementation MGCategoryViewModel


- (MGCategoryParent *)parent {
    
    if (!_parent) {
        _parent = ({
            MGCategoryParent *parent = [[MGCategoryParent alloc] init];
            RLMRealm *realm = RLMRealm.defaultRealm;
            [realm transactionWithBlock:^{
                [realm addObject:parent];
            }];
            parent;
        });
       
    }
    
    return _parent;
}

@end
