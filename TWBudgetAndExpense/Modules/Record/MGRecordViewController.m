//
//  MGRecordViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGRecordViewController.h"

@interface MGRecordViewController () <RETableViewManagerDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;

@end

@implementation MGRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    self.title = @"Record";
}

#pragma mark - Configure Views

- (void)configureNavigationItem {
    
    @weakify(self);
    
    self.navigationItem.leftBarButtonItem = ({
        UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemCancel handler:^(id sender) {
            @strongify(self);
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        item;
    });
    
}

- (void)configureViews {
    [super configureViews];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        tableView;
    });

    self.basicControlsSection = ({
        RETableViewSection *section = [RETableViewSection section];
        
        [self.manager addSection:section];
        section;
    });
}


@end
