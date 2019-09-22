//
//  MGChartsViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGChartsViewController.h"
#import "MGAPIManager.h"

#import "MGExchangeRateItem.h"
#import "MGExpenseChartItem.h"

@interface MGChartsViewController () <RETableViewManagerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;
@property (strong, nonatomic) RETableViewSection *expenseControlsSection;

@property (strong, nonatomic) MGExchangeRateItem *exchangeRateItem;

@property (nonatomic, strong) RLMNotificationToken *notification;

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
            
            UIViewController <MGTransactionViewControllerProtocol> *viewController = [[JSObjection defaultInjector] getObject:@protocol(MGTransactionViewControllerProtocol)];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];

            [self presentViewController:nav animated:YES completion:nil];
        }];
        item;
    });
    
}
    
- (void)configureViews {
    
    [super configureViews];
    @weakify(self);
    
    self.notification = [[RLMRealm defaultRealm] addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        @strongify(self);
        [self.tableView reloadData];
    }];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        tableView;
    });
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    self.manager[@"MGExchangeRateItem"] = @"MGExchangeRateTableViewCell";
    self.manager[@"MGExpenseChartItem"] = @"MGExpenseChartTableViewCell";

    self.basicControlsSection = ({
        RETableViewSection *section = [RETableViewSection section];
        section.headerTitle = @"Exchange Rate";
        section.footerTitle = [NSString stringWithFormat:@"UPDATE AT %@", [[MGExchangeRate sharedExchangeRate].updateDate stringWithFormat:@" yyyy-MM-dd HH:mm:ss"]];
        [self.manager addSection:section];
        section;
    });
    
    self.exchangeRateItem = ({
        
        MGExchangeRateItem *item = [MGExchangeRateItem item];
        [item setSelectionHandler:^(MGExchangeRateItem *item) {
            [item deselectRowAnimated:YES];
        }];
        
        [self.basicControlsSection addItem:item];
        item;
        
    });
    
    
    self.expenseControlsSection = ({
        RETableViewSection *section = [RETableViewSection section];
        section.headerTitle = @"Expense Chart";
        [self.manager addSection:section];
        
        
        [section addItem:({
            MGExpenseChartItem *item = [MGExpenseChartItem item];
            [item setSelectionHandler:^(MGExpenseChartItem *item) {
                [item deselectRowAnimated:YES];
            }];
            item;
        })];
        section;
        
    });



}



#pragma mark - getters

@end
