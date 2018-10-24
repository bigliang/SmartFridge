//
//  Fridge+CoreDataProperties.m
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "Fridge+CoreDataProperties.h"

@implementation Fridge (CoreDataProperties)

+ (NSFetchRequest<Fridge *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Fridge"];
}

@dynamic brand;

@end
