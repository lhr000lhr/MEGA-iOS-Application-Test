//
//  MGTransactionListViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionListViewController.h"
#import "MGTransactionListViewModel.h"

@interface MGTransactionListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RLMNotificationToken *notification;
@property (nonatomic, strong) MGTransactionListViewModel *viewModel;
    
@end



@implementation MGTransactionListViewController

- (void)viewDidLoad {
    self.viewModel = [[MGTransactionListViewModel alloc] init];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Transaction";

   

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
    
    
    self.notification = [self.viewModel.result addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        @strongify(self);
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kk"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"kk"];
    }
    
    MGTransaction *object = self.viewModel.result[indexPath.row];
    cell.textLabel.text = object.category.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"amount %0.2lf",object.amount];
    cell.imageView.image = [UIImage imageWithColor:[UIColor colorWithHexString:object.category.colorHex] size:CGSizeMake(30, 30)];
    
    
    return cell;
}

@end
