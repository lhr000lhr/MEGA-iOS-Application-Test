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
@property (strong, nonatomic) RETextItem *amountItem;

@property (strong, nonatomic) MGCategoryViewModel *viewModel;

@end

@implementation MGCategoryCreateViewController

#pragma mark - Lazy initialization


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"New Category";

}

#pragma mark - Configure Views

- (void)configureWithViewModel:(id<MGCategoryViewModelProtocol>)viewModel {
    self.viewModel = viewModel;

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
        UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemDone handler:^(id sender) {
            @strongify(self);

            // (1) Create a Dog object and then set its properties
            MGCategory *category = [[MGCategory alloc] init];
            category.name = @"Rex";
            category.budget = 200;
            category.colorHex = @"fff";
            category.currencyType = 0;
         
            [RLMRealm.defaultRealm beginWriteTransaction];
            [self.viewModel.parent.groups addObject:category];

            [RLMRealm.defaultRealm commitWriteTransaction];

            [self dismissViewControllerAnimated:YES completion:nil];

        }];
       
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
        [self.basicControlsSection addItem:item];
        item;
    });
    
    self.colorItem = ({
        RETableViewItem *item = [RETableViewItem itemWithTitle:@"Colour"];
        UIColor *categoryColor = [UIColor redColor];
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

#pragma mark - method


@end