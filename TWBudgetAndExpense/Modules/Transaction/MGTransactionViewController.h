//
//  MGTransactionViewController.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGTransactionViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGTransactionViewController : MGBaseViewController <MGTransactionViewControllerProtocol>

@property (strong, nonatomic) MGTransactionViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
