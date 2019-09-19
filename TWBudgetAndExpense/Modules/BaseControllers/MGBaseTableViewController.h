//
//  MGBaseTableViewController.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGBaseViewControllerProtocol.h"
#import <RETableViewManager/RETableViewManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGBaseTableViewController : UITableViewController <MGBaseViewControllerProtocol>

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;

@end

NS_ASSUME_NONNULL_END
