//
//  ShoppingList+CoreDataProperties.m
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "ShoppingList+CoreDataProperties.h"

@implementation ShoppingList (CoreDataProperties)

+ (NSFetchRequest<ShoppingList *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ShoppingList"];
}

@dynamic date;
@dynamic id;
@dynamic location;

@end
