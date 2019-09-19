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


@protocol MGRecordViewControllerProtocol <NSObject>
@end

@protocol MGCategoryCreateViewControllerProtocol <NSObject>
@end

@protocol MGCategoryViewModelProtocol <NSObject>
@property (nonatomic) MGCategoryParent *parent;
- (RACSignal *)fetchPinsWithTag:(NSString *)tag offset:(NSUInteger)offset;
- (RACSignal *)fetchMore;
@end

NS_ASSUME_NONNULL_END
