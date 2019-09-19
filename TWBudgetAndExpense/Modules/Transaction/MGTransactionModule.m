//
//  MGTransactionModule.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransactionModule.h"
#import "MGTransactionViewController.h"

@implementation MGTransactionModule

+ (void)load {
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector ? : [JSObjection createInjector];
    injector = [injector withModule:[[self alloc] init]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure {
    [self bindClass:[MGTransactionViewController class] toProtocol:@protocol(MGTransactionViewControllerProtocol)];
}

@end
