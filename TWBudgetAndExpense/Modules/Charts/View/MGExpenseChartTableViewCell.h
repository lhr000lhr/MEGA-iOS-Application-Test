//
//  MGExpenseChartTableViewCell.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RETableViewCell.h"
#import "PNChart.h"

NS_ASSUME_NONNULL_BEGIN

@interface MGExpenseChartTableViewCell : RETableViewCell

@property (strong, nonatomic) PNPieChart *pieChart;

@end

NS_ASSUME_NONNULL_END
