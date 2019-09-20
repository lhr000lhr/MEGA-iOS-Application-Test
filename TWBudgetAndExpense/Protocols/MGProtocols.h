//
//  MGProtocol.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal, MGCategoryParent, MGTransaction;

NS_ASSUME_NONNULL_BEGIN

@protocol MGCategoryViewModelProtocol <NSObject>
@property (strong, nonatomic) MGCategoryParent *parent;

@end

@protocol MGTransactionViewControllerProtocol <NSObject>

- (void)configureWithTransaction:(MGTransaction *)transaction;


@end

@protocol MGCategoryCreateViewControllerProtocol <NSObject>
- (void)configureWithViewModel:(id<MGCategoryViewModelProtocol>)viewModel;

@end


NS_ASSUME_NONNULL_END
