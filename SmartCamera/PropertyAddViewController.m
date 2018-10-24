//
//  PropertyAddViewController.m
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import "PropertyAddViewController.h"
#import "Property+CoreDataProperties.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@implementation PropertyAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)Save:(UIButton *)sender {
    NSManagedObjectContext *moc = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    
    Property* item = [NSEntityDescription insertNewObjectForEntityForName:@"Property"
                                                   inManagedObjectContext:moc];
    item.name = self.name.text;
    item.location = self.location.text;
    item.price = self.price.text;
    [((AppDelegate *)[UIApplication sharedApplication].delegate) saveContext];
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)Cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
