//
//  MGChartsViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGChartsViewController.h"

@interface MGChartsViewController ()

@end

@implementation MGChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Chart";


}

#pragma mark - Configure Views

- (void)configureNavigationItem {
    
    @weakify(self);
    
    self.navigationItem.rightBarButtonItem = ({
        UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemAdd handler:^(id sender) {
            @strongify(self);
            
            UIViewController <MGTransacationViewControllerProtocol> *viewController = [[JSObjection defaultInjector] getObject:@protocol(MGTransacationViewControllerProtocol)];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];

            [self presentViewController:nav animated:YES completion:nil];
        }];
        item;
    });
    
}
    
- (void)configureViews {
    
    




}

@end
