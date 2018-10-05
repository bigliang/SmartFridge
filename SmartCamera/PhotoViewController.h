//
//  PhotoViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Property+CoreDataProperties.h"
#import "CameraViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface PhotoViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong) NSMutableArray* photos;
@property (nonatomic,strong) Property* property;
@property (weak, nonatomic) IBOutlet UICollectionView *uiCollectionView;

@end

NS_ASSUME_NONNULL_END
