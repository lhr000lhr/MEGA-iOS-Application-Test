//
//  MGProtocol.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal, MGCategoryParent, MGTransaction, MGCategory;

NS_ASSUME_NONNULL_BEGIN

@protocol MGCategoryViewModelProtocol <NSObject>

- (instancetype)initWithCategory:(MGCategory *)category;
@property (strong, nonatomic) MGCategoryParent *parent;

@end

@protocol MGTransactionViewControllerProtocol <NSObject>

- (void)configureWithTransaction:(MGTransaction *)transaction;


@end

@protocol MGCategoryCreateViewControllerProtocol <NSObject>
- (void)configureWithCategory:(MGCategory *)category;

@end


NS_ASSUME_NONNULL_END
