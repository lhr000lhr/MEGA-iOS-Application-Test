
//
//  MGExpenseChartTableViewCell.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGExpenseChartTableViewCell.h"
#import "MGExpenseChartViewModel.h"
#import "PNChart.h"
#import "MGCategory.h"
#import "MGTransaction.h"

@interface MGExpenseChartTableViewCell ()

@property (strong, nonatomic) PNPieChart *pieChart;
@property (strong, nonatomic) MGExpenseChartViewModel *viewModel;

@end


@implementation MGExpenseChartTableViewCell

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager {
    
    return 220;
    
}



#pragma mark -
#pragma mark Cell life cycle


- (void)cellDidLoad {
    [super cellDidLoad];

    NSMutableArray *items = @[].mutableCopy;
    
    for (MGCategory *category in self.viewModel.result) {
        [items addObject:({
            [PNPieChartDataItem dataItemWithValue:category.calculatedBudget
                                            color:[UIColor colorWithHexString:category.colorHex]
                                      description:category.name
             ];
        })];
    }
 
    self.pieChart = ({
        PNPieChart *chart = [[PNPieChart alloc] initWithFrame:CGRectZero items:items];
        [self.contentView addSubview:chart];
        [chart mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(@200);
            make.center.equalTo(self.contentView);
        }];
        chart;
    });
    
    
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showOnlyValues = NO;
    self.pieChart.showAbsoluteValues = NO;
    [self.pieChart strokeChart];

}


- (void)cellWillAppear {
    [super cellWillAppear];
    NSMutableArray *items = @[].mutableCopy;
    
    for (MGCategory *category in self.viewModel.result) {
        [items addObject:({
            [PNPieChartDataItem dataItemWithValue:category.calculatedAmount
                                            color:[UIColor colorWithHexString:category.colorHex]
                                      description:category.name
             ];
        })];
    }
    
    // category of none
    
    RLMResults *result = [MGTransaction objectsWhere:@"category == nil"];
    
    double amount = 0;
    for (MGTransaction *transaction in result) {
        amount = amount + transaction.calculatedAmount;
    }
    if (amount > 0) {
        [items addObject:({
            [PNPieChartDataItem dataItemWithValue:amount
                                            color:kDefaultCategoryColorflatGray
                                      description:@"other"
             ];
        })];
        
    }
    
    self.pieChart.hidden = items.count <= 0;

    [self.pieChart updateChartData:items];
    [self.pieChart strokeChart];

}

#pragma mark - getters

- (MGExpenseChartViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MGExpenseChartViewModel alloc] init];
        
    }
    return _viewModel;
}


@end
