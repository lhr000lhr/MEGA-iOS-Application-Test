//
//  MGBaseViewController.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGBaseViewController.h"

@interface MGBaseViewController ()

@end

@implementation MGBaseViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavigationItem];
    [self configureViews];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (void)dealloc {
    
    NSLog(@"%@ has been released",NSStringFromClass([self class]));
    
}

#pragma mark - Configure tableView

- (void)configureViews {
    
}

- (void)configureNavigationItem {
    
}

@end
