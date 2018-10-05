//
//  CameraViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo+CoreDataProperties.h"
NS_ASSUME_NONNULL_BEGIN

@interface CameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) Property* property;
@end

NS_ASSUME_NONNULL_END
