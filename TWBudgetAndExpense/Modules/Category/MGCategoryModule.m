//
//  MGCategoryModule.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategoryModule.h"
#import "MGCategoryCreateViewController.h"


@implementation MGCategoryModule

+ (void)load {
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector ? : [JSObjection createInjector];
    injector = [injector withModule:[[self alloc] init]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure {
    [self bindClass:[MGCategoryCreateViewController class] toProtocol:@protocol(MGCategoryCreateViewControllerProtocol)];
}

@end

