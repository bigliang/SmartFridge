//
//  PhotoDetailViewController.m
//  SmartCamera
//
//  Created by  shihongliang on 10/5/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSManagedObjectContext *moc = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Photo"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"id = %@" , self.photo.id];
    self.item = [[moc executeFetchRequest:fetchRequest error:nil]objectAtIndex:0];
    self.imageView.image =  [UIImage imageWithData:[self.item valueForKey:@"image"]];
    self.labelTextField.text = self.item.label;
    self.commentTextField.text = self.item.comment;
}
- (IBAction)Save:(id)sender {
    
    self.item.label = self.labelTextField.text;
    self.item.comment = self.commentTextField.text;
    [((AppDelegate *)[UIApplication sharedApplication].delegate) saveContext];
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
- (IBAction)Cancel:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
