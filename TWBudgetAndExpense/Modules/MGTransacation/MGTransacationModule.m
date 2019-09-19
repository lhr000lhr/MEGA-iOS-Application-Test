//
//  MGTransacationModule.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/17.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransacationModule.h"
#import "MGTransacationViewController.h"

@implementation MGTransacationModule

+ (void)load {
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    injector = injector ? : [JSObjection createInjector];
    injector = [injector withModule:[[self alloc] init]];
    [JSObjection setDefaultInjector:injector];
}

- (void)configure {
    [self bindClass:[MGTransacationViewController class] toProtocol:@protocol(MGTransacationViewControllerProtocol)];
}

@end
