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
#import <UserNotifications/UserNotifications.h>
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
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = self.item.expireDate;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.expireDateTextField.text = dateString;
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.expireDateTextField setInputView:datePicker];
    UITapGestureRecognizer *gesRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)]; // Declare the Gesture.
    gesRecognizer.delegate = self;
    [self.view addGestureRecognizer:gesRecognizer];
}
-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.expireDateTextField.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    NSLog(dateString);
    self.expireDateTextField.text = [NSString stringWithFormat:@"%@",dateString];
}
- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer{
    NSLog(@"Tapped");
    [self.expireDateTextField endEditing:YES];
}
- (IBAction)Save:(id)sender {
    
    self.item.label = self.labelTextField.text;
    self.item.comment = self.commentTextField.text;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    self.item.expireDate = [dateFormat dateFromString:self.expireDateTextField.text];
    [((AppDelegate *)[UIApplication sharedApplication].delegate) saveContext];
    [self dismissViewControllerAnimated:NO completion:nil];
    
    [self setNotifiCation];
}
- (void) setNotifiCation{
    if (@available(iOS 10.0, *)) {
        UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
        content.title = [NSString localizedUserNotificationStringForKey:@"Careful!" arguments:nil];
        //NSString *string1 = @"This is";
        NSString *string2 = @" will expire please handle it !";
        NSString *string3 = [self.item.label stringByAppendingString:string2];
        content.body = [NSString localizedUserNotificationStringForKey:string3
            arguments:nil];
        NSDateComponents* date = [[NSDateComponents alloc] init];
        date.hour = 7;
        date.minute = 0;
       // UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger
         //                                         triggerWithDateMatchingComponents:date repeats:NO];
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
        // Create the request object.
        UNNotificationRequest* request = [UNNotificationRequest
                                          requestWithIdentifier:@"MorningAlarm" content:content trigger:trigger];
        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
        UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
        [center requestAuthorizationWithOptions:options
                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                  if (!granted) {
                                      NSLog(@"Something went wrong");
                                  }
                              }];
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if (error != nil) {
                NSLog(@"%@", error.localizedDescription);
            }
        }];
    } else {
        // Fallback on earlier versions
    }
    
}
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler API_AVAILABLE(ios(10.0)){
    NSLog(@"User Info : %@",notification.request.content.userInfo);
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
}
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler API_AVAILABLE(ios(10.0)){
    NSLog(@"User Info : %@",response.notification.request.content.userInfo);
    completionHandler();
}
- (IBAction)Cancel:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
