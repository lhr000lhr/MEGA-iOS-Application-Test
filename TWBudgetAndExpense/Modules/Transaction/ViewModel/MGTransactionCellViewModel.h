//
//  MGTransactionCellViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"
#import "MGTransaction.h"
NS_ASSUME_NONNULL_BEGIN

@interface MGTransactionCellViewModel : RVMViewModel

@property (strong, nonatomic) MGTransaction *transaction;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) double exchangeAmount;
@property (strong, nonatomic, readonly) NSString *detailText;
@end

NS_ASSUME_NONNULL_END
