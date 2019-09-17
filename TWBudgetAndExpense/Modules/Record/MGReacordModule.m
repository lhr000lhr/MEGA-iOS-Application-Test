//
//  MGReacordModule.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGReacordModule.h"
#import "MGRecordTableViewController.h"
#import <Objection.h>

@implementation MGReacordModule

+ (void)load
{
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector ? : [JSObjection createInjector];
    injector = [injector withModule:[[self alloc] init]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure
{
    [self bindClass:[MGRecordTableViewController class] toProtocol:@protocol(MGRecordTableViewControllerProtocol)];
}

@end
