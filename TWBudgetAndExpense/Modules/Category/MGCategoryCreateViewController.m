//
//  MGCategoryCreateViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryCreateViewController.h"

@interface MGCategoryCreateViewController () <RETableViewManagerDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;

@property (strong, nonatomic) RETextItem *nameItem;
@property (strong, nonatomic) REPickerItem *colorItem;
@property (strong, nonatomic) RETextItem *amountItem;

@end

@implementation MGCategoryCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"New Category";
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
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    self.basicControlsSection = ({
        RETableViewSection *section = [RETableViewSection section];
        
        [self.manager addSection:section];
        section;
    });

    self.nameItem = ({
        RETextItem *item = [RETextItem itemWithTitle:@"Name"];
        item.keyboardType = UIKeyboardTypeNumberPad;
        item.placeholder = @"input here";
        [self.basicControlsSection addItem:item];
        item;
    });
    
    self.colorItem = ({
        REPickerItem *item = [REPickerItem itemWithTitle:@"Colour" value:@[] placeholder:nil options:nil];
        [self.basicControlsSection addItem:item];
        item;
    });
    
    self.amountItem = ({
        RETextItem *item = [RETextItem itemWithTitle:@"Amount"];
        item.keyboardType = UIKeyboardTypeNumberPad;
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
