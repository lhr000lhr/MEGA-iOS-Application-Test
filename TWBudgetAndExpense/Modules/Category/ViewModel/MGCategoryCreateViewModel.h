//
//  MGCategoryCreateViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"
#import "MGCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGCategoryCreateViewModel : RVMViewModel

@property (strong, nonatomic) MGCategoryParent *Categories;

@end

NS_ASSUME_NONNULL_END
