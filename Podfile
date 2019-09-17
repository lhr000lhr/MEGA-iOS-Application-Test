# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TWBudgetAndExpense' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for TWBudgetAndExpense
  pod 'YYKit'
  pod 'Realm'
  pod 'Masonry'
  pod 'BlocksKit'
  pod 'Objection', '~> 0.9'
  pod 'DZNEmptyDataSet'
  pod 'ReactiveCocoa', '2.5'
  pod 'ReactiveViewModel', '~>0.1'
  pod 'RETableViewManager'
  pod 'FDFullscreenPopGesture', '~> 1.1'
  pod 'UINavigationItem+Loading', '~> 1.1'
  pod 'UITableView+FDTemplateLayoutCell', '~> 1.4.beta'


  target 'TWBudgetAndExpenseTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Realm/Headers'
    pod 'Kiwi'

  end

  pre_install do
      system("sed -i '' '/UITextField/d' Pods/BlocksKit/BlocksKit/BlocksKit+UIKit.h")
      system('rm Pods/BlocksKit/BlocksKit/UIKit/UITextField+BlocksKit.h')
      system('rm Pods/BlocksKit/BlocksKit/UIKit/UITextField+BlocksKit.m')
  end
end
