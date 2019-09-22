//
//  MGExchangeRateTableViewCell.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/22.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGExchangeRateTableViewCell.h"

@implementation MGExchangeRateTableViewCell

+ (CGFloat)heightWithItem:(NSObject *)item tableViewManager:(RETableViewManager *)tableViewManager {
    
    return 70;
    
}



#pragma mark -
#pragma mark Cell life cycle


- (void)cellDidLoad {
    [super cellDidLoad];
    self.USDLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"USD🇺🇸: $ 1";
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).mas_offset(16);
            make.height.equalTo(@50);
            make.right.equalTo(self.contentView.mas_centerX).mas_offset(-16);
            make.center.equalTo(self.contentView);

        }];
        label;
    });
    
    self.NZDLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = [NSString stringWithFormat:@"NZD🇳🇿: $ %.4lf", [MGExchangeRate sharedExchangeRate].rate];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_centerX).mas_offset(16);
            make.height.equalTo(@50);
            make.right.equalTo(self.contentView).mas_offset(-16);
            make.center.equalTo(self.contentView);

        }];
        label;
    });
}


- (void)cellWillAppear {
    [super cellWillAppear];
    



}

@end
