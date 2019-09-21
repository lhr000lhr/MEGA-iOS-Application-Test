//
//  MGCategoryCreateViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryCreateViewController.h"
#import <MSColorPicker/MSColorPicker.h>
#import "MGCategoryCreateViewModel.h"
#import "MGCategoryViewModel.h"

@interface MGCategoryCreateViewController () <RETableViewManagerDelegate, MSColorSelectionViewControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) RETableViewSection *basicControlsSection;

@property (strong, nonatomic) RETextItem *nameItem;
@property (strong, nonatomic) RETableViewItem *colorItem;
@property (strong, nonatomic) RETextItem *budgetItem;

@property (strong, nonatomic) MGCategoryViewModel *viewModel;

@end

@implementation MGCategoryCreateViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"New Category";

}

#pragma mark - Configure Views

- (void)configureWithCategory:(MGCategory *)category {
    self.viewModel = [[MGCategoryViewModel alloc] initWithCategory:category];
    @weakify(self)
    [self.viewModel setDismissBlock:^{
        @strongify(self)
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}



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
        UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemDone handler:nil];
        item.rac_command = self.viewModel.doneButtonCommand;
        item;
    });
}


- (void)configureViews {
    [super configureViews];
    
    @weakify(self);
   
    
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
        item.placeholder = @"input here";
        RACChannelTo(item, value) = RACChannelTo(self.viewModel, name);
        [self.basicControlsSection addItem:item];
        item;
    });
    
    self.colorItem = ({
        RETableViewItem *item = [RETableViewItem itemWithTitle:@"Colour"];
        UIColor *categoryColor = self.viewModel.colorHex ? [UIColor colorWithHexString:self.viewModel.colorHex] : [UIColor redColor];
        
        [item setImage:[UIImage imageWithColor:categoryColor size:CGSizeMake(30, 30)]];
        [item setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        [item setSelectionHandler:^(RETableViewItem *item) {
            [item deselectRowAnimated:YES];
            @strongify(self);
            MSColorSelectionViewController *colorSelectionController = [[MSColorSelectionViewController alloc] init];
            UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:colorSelectionController];
           
            colorSelectionController.color = categoryColor;
            colorSelectionController.delegate = self;
           
            [[self rac_signalForSelector:@selector(colorViewController:didChangeColor:) fromProtocol:@protocol(MSColorSelectionViewControllerDelegate)] subscribeNext:^(RACTuple *tuple) {
                MSColorSelectionViewController *vc = tuple.first;
                [item setImage:[UIImage imageWithColor:vc.color size:CGSizeMake(30, 30)]];
                self.viewModel.colorHex = [vc.color hexString];
                [item reloadRowWithAnimation:UITableViewRowAnimationAutomatic];
            }];
            
            if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
                colorSelectionController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"Done" style:UIBarButtonItemStyleDone handler:^(id sender) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }];
            }
            
            [self presentViewController:navCtrl animated:YES completion:nil];
            
        }];
        [self.basicControlsSection addItem:item];
        item;
    });
    
    self.budgetItem = ({
        RETextItem *item = [RETextItem itemWithTitle:@"Budget"];
        item.keyboardType = UIKeyboardTypeDecimalPad;
        item.placeholder = @"input here";
        item.value = [NSString stringWithFormat:@"%lf",self.viewModel.budget];
        [item setOnChange:^(RETextItem *item) {
            self.viewModel.budget = [item.value doubleValue];
        }];

        item.accessoryView = ({
            UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"NZD",@"USD"]];
            RACChannelTo(segmentedControl, selectedSegmentIndex) = RACChannelTo(self.viewModel, currencyType);

            segmentedControl;
        });
        [self.basicControlsSection addItem:item];
        item;
    });
}

#pragma mark - method


#pragma mark - getters

- (MGCategoryViewModel *)viewModel {
    @weakify(self);
    
    if (!_viewModel) {
        _viewModel = [[MGCategoryViewModel alloc] init];
        [_viewModel setDismissBlock:^{
            @strongify(self)
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }
    return _viewModel;
}

@end
