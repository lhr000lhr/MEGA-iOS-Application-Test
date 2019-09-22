//
//  MGTransactionViewModelSpec.m
//  TWBudgetAndExpenseTests
//
//  Created by haoran lee on 2019/9/21.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa.h>
#import <Realm.h>

#import "MGTransactionViewModel.h"



SPEC_BEGIN(MGTransactionViewModelSpec)
describe(@"MGTransactionViewModel", ^{
    __block MGTransactionViewModel* viewModel = nil;
    
    beforeEach(^{
        viewModel = [[MGTransactionViewModel alloc] init];
    });
    
    afterEach(^{
        viewModel = nil;
    });
    
    
    context(@"when complete all forms", ^{
        __block BOOL result = NO;
        
        it(@"should return signal that value is YES", ^{
            viewModel.selectedCategoryName = @"category name";
            viewModel.amount = @"100";
            
            [[viewModel checkFormSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];
            
            [[theValue(result) should] beYes];
        });
    });
    
    
    context(@"when lack some parameters", ^{
        __block BOOL result = NO;
        
        it(@"should return signal that value is NO", ^{
            viewModel.selectedCategoryName = @"category name";

            [[viewModel checkFormSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];
            
            [[theValue(result) should] beNo];
        });
        
        
        it(@"should return signal that value is NO", ^{
            viewModel.amount = @"100";

            [[viewModel checkFormSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];
            
            [[theValue(result) should] beNo];
        });
        
        
        it(@"should return signal that value is NO", ^{
            
            [[viewModel checkFormSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];
            
            [[theValue(result) should] beNo];
        });
      
    });
    
    
});


SPEC_END
