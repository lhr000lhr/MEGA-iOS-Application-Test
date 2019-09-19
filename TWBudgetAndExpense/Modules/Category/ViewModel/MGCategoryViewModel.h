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

typedef void(^ViewControllerDismissBlock)(void);

@interface MGCategoryViewModel : RVMViewModel <MGCategoryViewModelProtocol>

@property MGCategoryParent *parent;
@property (strong, nonatomic) MGCategory *category;
@property (strong, nonatomic) RACCommand *doneButtonCommand;
@property (copy, nonatomic) ViewControllerDismissBlock dismissBlock;

- (RACSignal*)checkFormSignal;

@end

NS_ASSUME_NONNULL_END
