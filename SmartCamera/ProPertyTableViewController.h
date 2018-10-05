//
//  ProPertyTableViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "PhotoViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProPertyTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>
@property (strong) NSMutableArray *Properties;
@property (nonatomic, retain) NSFetchedResultsController* fetchedResultsController;
@property (strong,nonatomic)Property* property;
@end

NS_ASSUME_NONNULL_END
