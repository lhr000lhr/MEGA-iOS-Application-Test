//
//  MGCategoryViewModel.h
//  TWBudgetAndExpense
//
//  Created by haoran lee on 2019/9/18.
//  Copyright © 2019 MEGA. All rights reserved.
//

#import "RVMViewModel.h"
#import "MGCategory.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ViewControllerDismissBlock)(void);

@interface MGCategoryViewModel : RVMViewModel 


@property (strong, nonatomic) MGCategory *category;
@property (strong, nonatomic) RACCommand *doneButtonCommand;
@property (copy, nonatomic) ViewControllerDismissBlock dismissBlock;
@property (strong, nonatomic) RLMResults *result;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *colorHex;
@property (assign, nonatomic) NSString *budget;
@property MGCurrencyType currencyType;


- (RACSignal *)checkFormSignal;
- (instancetype)initWithCategory:(MGCategory *)category;
- (RACSignal *)checkBudgetLabelSignal;

@end

NS_ASSUME_NONNULL_END
