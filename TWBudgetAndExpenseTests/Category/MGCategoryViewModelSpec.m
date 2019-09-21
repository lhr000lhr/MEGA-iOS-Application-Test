//
//  MGCategoryViewModelSpec.m
//  TWBudgetAndExpenseTests
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa.h>
#import <Realm.h>

#import "MGCategoryViewModel.h"



SPEC_BEGIN(MGCategoryViewModelSpec)
describe(@"MGCategoryViewModel", ^{
    __block MGCategoryViewModel* viewModel = nil;

    beforeEach(^{
        viewModel = [[MGCategoryViewModel alloc] init];
    });
    
    afterEach(^{
        viewModel = nil;
    });
    
    
    context(@"when complete all forms", ^{
        __block BOOL result = NO;
        
        it(@"should return signal that value is YES", ^{
            viewModel.name = @"test name";
            viewModel.colorHex = @"ffffff";
            viewModel.budget = 100;
            
            [[viewModel checkFormSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];
            
            [[theValue(result) should] beYes];
        });
    });
    

    context(@"when lack some parameters", ^{
        __block BOOL result = NO;
        
        it(@"should return signal that value is NO", ^{
            viewModel.name = @"";
            viewModel.colorHex = @"ffffff";
            viewModel.budget = 100;
            
            [[viewModel checkFormSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];
            
            [[theValue(result) should] beNo];
        });
    });
    
    
});


SPEC_END
