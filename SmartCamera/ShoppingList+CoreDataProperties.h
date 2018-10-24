//
//  ShoppingList+CoreDataProperties.h
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "ShoppingList+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ShoppingList (CoreDataProperties)

+ (NSFetchRequest<ShoppingList *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *location;

@end

NS_ASSUME_NONNULL_END
