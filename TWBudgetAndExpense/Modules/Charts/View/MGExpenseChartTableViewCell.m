
//
//  MGExpenseChartTableViewCell.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGExpenseChartTableViewCell.h"

@implementation MGExpenseChartTableViewCell

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager {
    
    return 220;
    
}



#pragma mark -
#pragma mark Cell life cycle


- (void)cellDidLoad {
    [super cellDidLoad];
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"WWDC"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"GOOG I/O"],
                       ];
    
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
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    
    
    [self.pieChart strokeChart];

}


- (void)cellWillAppear {
    [super cellWillAppear];

    
}


@end
