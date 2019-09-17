//
//  MGBaseViewControllerProtocal.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MGBaseViewControllerProtocal <NSObject>
@optional
- (void)configureNavigationItem;
- (void)configureViews;

@end

NS_ASSUME_NONNULL_END
