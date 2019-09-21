//
//  MGToolUtilitiesSpec.m
//  TWBudgetAndExpenseTests
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa.h>
#import <Realm.h>

#import "MGToolUtilities.h"


SPEC_BEGIN(MGToolUtilitiesSpec)
describe(@"MGToolUtilitiesSpec", ^{
    
    
    context(@"when put a currency type NDZ", ^{
        __block NSString *result = nil;

        it(@"should return a string NZD ", ^{

            result = [MGToolUtilities convertStringWithCurrencyType:MGCurrencyTypeNZD];


            [[result should] equal:@"NZD"];
        });
    });

    context(@"when put a currency type USD", ^{
        __block NSString *result = nil;

        it(@"should return a string USD ", ^{

            result = [MGToolUtilities convertStringWithCurrencyType:MGCurrencyTypeUSD];

            [[result should] equal:@"USD"];
        });
    });

    context(@"when put something else", ^{
        __block NSString *result = nil;

        it(@"should return a string NZD ", ^{

            result = [MGToolUtilities convertStringWithCurrencyType:3];

            [[result should] equal:@"NZD"];
        });
    });
});


SPEC_END
