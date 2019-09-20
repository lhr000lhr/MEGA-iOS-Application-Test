//
//  MGTransaction.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/19.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGTransaction.h"

@implementation MGTransaction

+ (NSDictionary *)linkingObjectsProperties {
    return @{@"category":[RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"MGCategory") propertyName:@"transactions"]};
}

@end
