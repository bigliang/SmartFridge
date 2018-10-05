//
//  PhotoCollectionViewController.h
//  SmartCamera
//
//  Created by  shihongliang on 10/4/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong) NSMutableArray *photos;
@end

NS_ASSUME_NONNULL_END
