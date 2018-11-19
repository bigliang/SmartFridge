//
//  MenuTableViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 11/7/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "foodMenu.h"
#import "MenuDetailViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MenuTableViewController : UITableViewController <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>
@property (strong, nonatomic) NSMutableArray* menuArray;
@property (strong, nonatomic) UISearchController *searchController;
@property (nonatomic, strong) NSArray *searchResult;
@property (nonatomic) BOOL* searchEnabled;
//for the results to be shown with two table delegates

@end

NS_ASSUME_NONNULL_END
