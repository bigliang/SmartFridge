//
//  PhotoDetailViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 10/5/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo+CoreDataProperties.h"
#import <UserNotifications/UserNotifications.h>
NS_ASSUME_NONNULL_BEGIN

@interface PhotoDetailViewController : UIViewController<UNUserNotificationCenterDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *labelTextField;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (strong,nonatomic) Photo* photo;
@property (strong,nonatomic) Photo* item;
@property (weak, nonatomic) IBOutlet UITextField *expireDateTextField;
-(void) dateTextField:(id)sender;
@end

NS_ASSUME_NONNULL_END
