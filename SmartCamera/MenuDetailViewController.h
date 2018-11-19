//
//  MenuDetailViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 11/18/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "foodMenu.h"
NS_ASSUME_NONNULL_BEGIN

@interface MenuDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property(nonatomic,strong) foodMenu* recipt;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@end

NS_ASSUME_NONNULL_END
