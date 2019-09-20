//
//  MGCategory.m
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "MGCategory.h"

@implementation MGCategory

+ (NSString *)primaryKey {
    return @"name";
}

+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"transactions" : [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"MGTransaction")
                                                         propertyName:@"category"]
             };
}

@end
