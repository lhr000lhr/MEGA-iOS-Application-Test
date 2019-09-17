//
//  MGRecordTableViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGRecordTableViewController.h"

@interface MGRecordTableViewController () <RETableViewManagerDelegate>

@property (strong, nonatomic) RETableViewManager *manager;

@end

@implementation MGRecordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
}



@end
