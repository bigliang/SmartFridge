//
//  PropertyTableViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "PhotoViewController.h"
@import GoogleSignIn;



@interface PropertyTableViewController : UITableViewController<NSFetchedResultsControllerDelegate,UIGestureRecognizerDelegate>
@property (strong) NSMutableArray *Properties;
@property (nonatomic, retain) NSFetchedResultsController* fetchedResultsController;
@property (strong,nonatomic)Property* property;

@property(weak, nonatomic) IBOutlet GIDSignInButton* signInButton;
@end


