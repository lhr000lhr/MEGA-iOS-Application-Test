//
//  MGBaseTableViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGBaseTableViewController.h"

@interface MGBaseTableViewController () <RETableViewManagerDelegate>

@end

@implementation MGBaseTableViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavigationItem];
    [self configureViews];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    [self configureTableView];
    
    [self configureStyle];
    
    
}

- (void)dealloc {
    
    NSLog(@"%@ has been released",NSStringFromClass([self class]));
    
}

#pragma mark - Configure tableView

- (void)configureViews {
    
}

- (void)configureTableView {
    
    
}

- (void)configureStyle {
    
    
}


@end
