//
//  Menu+CoreDataProperties.m
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "Menu+CoreDataProperties.h"

@implementation Menu (CoreDataProperties)

+ (NSFetchRequest<Menu *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Menu"];
}


@end
