//
//  Menu+CoreDataProperties.h
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "Menu+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Menu (CoreDataProperties)

+ (NSFetchRequest<Menu *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
