//
//  MGCategoryViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"
#import "MGCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGCategoryViewModel : RVMViewModel <MGCategoryViewModelProtocol>

@property MGCategoryParent *parent;


@end

NS_ASSUME_NONNULL_END
