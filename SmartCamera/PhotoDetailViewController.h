//
//  PhotoDetailViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 10/5/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo+CoreDataProperties.h"
NS_ASSUME_NONNULL_BEGIN

@interface PhotoDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *labelTextField;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (strong,nonatomic) Photo* photo;
@property (strong,nonatomic) Photo* item;
@end

NS_ASSUME_NONNULL_END
