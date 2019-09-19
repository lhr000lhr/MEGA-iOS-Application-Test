//
//  MGCategoryViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryViewController.h"
#import "MGCategoryViewModel.h"

@interface MGCategoryViewController () <RETableViewManagerDelegate, UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;

@property (strong, nonatomic) MGCategoryViewModel *viewModel;

@end

@implementation MGCategoryViewController

#pragma mark - Lazy initialization



#pragma mark - View lifecycle

- (void)viewDidLoad {
    self.viewModel = [[MGCategoryViewModel alloc] init];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Category";

    
}

#pragma mark - Configure Views

- (void)configureNavigationItem {
    
    @weakify(self);
    
    self.navigationItem.rightBarButtonItem = ({
        UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemAdd handler:^(id sender) {
            @strongify(self);
            
            UIViewController <MGCategoryCreateViewControllerProtocol> *viewController = [[JSObjection defaultInjector] getObject:@protocol(MGCategoryCreateViewControllerProtocol)];
//            [viewController configureWithViewModel:self.viewModel];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
            
            [self presentViewController:nav animated:YES completion:nil];
        }];
        item;
    });
    
}

- (void)configureViews {
    
    
    @weakify(self);
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        tableView;
    });
    
    [[self.viewModel.parent rac_valuesAndChangesForKeyPath:@"groups" options:0 observer:self]
     subscribeNext:^(RACTuple *info) { // tuple is value, change dictionary
         @strongify(self);

         [self.tableView reloadData];
     }];


    
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.parent.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kk"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"kk"];
    }
    
    MGCategory *object = self.viewModel.parent.groups[indexPath.row];
    cell.textLabel.text = object.name;
    cell.detailTextLabel.text = object.colorHex;
    
    return cell;
}


@end
