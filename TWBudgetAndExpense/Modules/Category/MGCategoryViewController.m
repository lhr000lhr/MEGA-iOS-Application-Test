//
//  MGCategoryViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryViewController.h"
#import "MGCategoryViewModel.h"
#import "MGToolUtilities.h"
#import "MGCategoryTableViewCell.h"
#import "MGCategoryCellViewModel.h"

static NSString *cellIdentifier = @"categoryCell";

@interface MGCategoryViewController () <RETableViewManagerDelegate, UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;

@property (strong, nonatomic) MGCategoryViewModel *viewModel;
@property (nonatomic, strong) RLMNotificationToken *notification;

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
    

    self.notification = [[RLMRealm defaultRealm] addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        [self.tableView reloadData];
    }];
  
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.result.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MGCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[MGCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    
    MGCategory *category = self.viewModel.result[indexPath.row];
    
    MGCategoryCellViewModel *viewModel = [[MGCategoryCellViewModel alloc] init];
    viewModel.category = category;
    [cell configureWithViewModel:viewModel];

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        RLMRealm *realm = RLMRealm.defaultRealm;
        [realm beginWriteTransaction];
        [realm deleteObject:self.viewModel.result[indexPath.row]];
        [realm commitWriteTransaction];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    MGCategory *transaction = self.viewModel.result[indexPath.row];
    
    UIViewController <MGCategoryCreateViewControllerProtocol> *viewController = [[JSObjection defaultInjector] getObject:@protocol(MGCategoryCreateViewControllerProtocol)];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [viewController configureWithCategory:transaction];

    [self presentViewController:nav animated:YES completion:nil];
}


@end
