//
//  MGChartsViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGChartsViewController.h"
#import "MGAPIManager.h"
#import "MGExchangeRateModel.h"

@interface MGChartsViewController ()

@end

@implementation MGChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Chart";
    [[[MGAPIManager sharedManager] fetchExchangeRate] subscribeNext:^(MGExchangeRateModel *rateModel) {
 


    }];

}

#pragma mark - Configure Views

- (void)configureNavigationItem {
    
    @weakify(self);
    
    self.navigationItem.rightBarButtonItem = ({
        UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemAdd handler:^(id sender) {
            @strongify(self);
            
            UIViewController <MGTransactionViewControllerProtocol> *viewController = [[JSObjection defaultInjector] getObject:@protocol(MGTransactionViewControllerProtocol)];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];

            [self presentViewController:nav animated:YES completion:nil];
        }];
        item;
    });
    
}
    
- (void)configureViews {
    
    




}

@end
