//
//  MGTransactionViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionViewController.h"

@interface MGTransactionViewController () <RETableViewManagerDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;

@property (strong, nonatomic) REDateTimeItem *dateItem;
@property (strong, nonatomic) REPickerItem *categoryItem;
@property (strong, nonatomic) RETextItem *amountItem;

@property (strong, nonatomic) MGTransactionViewModel *viewModel;

@end

@implementation MGTransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.viewModel = [[MGTransactionViewModel alloc] init];
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
    
    self.navigationItem.rightBarButtonItem = ({
        UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemDone handler:^(id sender) {
            @strongify(self);



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
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];

    self.basicControlsSection = ({
        RETableViewSection *section = [RETableViewSection section];
        
        [self.manager addSection:section];
        section;
    });
    
    
    self.dateItem = ({
        REDateTimeItem *item = [REDateTimeItem itemWithTitle:@"Date" value:[NSDate date] placeholder:nil format:@"yyyy/MM/dd" datePickerMode:UIDatePickerModeDate];
        [self.basicControlsSection addItem:item];
        item;
    });
    
    self.categoryItem = ({
        REPickerItem *item = [REPickerItem itemWithTitle:@"Category" value:@[] placeholder:nil options:nil];
        [self.basicControlsSection addItem:item];
      
        item;
    });
    
    self.amountItem = ({
        RETextItem *item = [RETextItem itemWithTitle:@"Amount"];
        item.keyboardType = UIKeyboardTypeDecimalPad;
        item.placeholder = @"input here";
        item.accessoryView = ({
            UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"NZD",@"USD"]];
            segmentedControl.selectedSegmentIndex = 0;
            segmentedControl;
        });
        [self.basicControlsSection addItem:item];
        item;
    });
}


@end
