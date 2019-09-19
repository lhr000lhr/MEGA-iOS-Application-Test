//
//  MGProtocol.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal, MGCategoryParent;

NS_ASSUME_NONNULL_BEGIN

@protocol MGCategoryViewModelProtocol <NSObject>
@property MGCategoryParent *parent;
- (RACSignal *)fetchPinsWithTag:(NSString *)tag offset:(NSUInteger)offset;
- (RACSignal *)fetchMore;
@end

@protocol MGRecordViewControllerProtocol <NSObject>
@end

@protocol MGCategoryCreateViewControllerProtocol <NSObject>
- (void)configureWithViewModel:(id<MGCategoryViewModelProtocol>)viewModel;

@end


NS_ASSUME_NONNULL_END
