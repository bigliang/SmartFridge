//
//  Property+CoreDataProperties.m
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "Property+CoreDataProperties.h"

@implementation Property (CoreDataProperties)

+ (NSFetchRequest<Property *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Property"];
}

@dynamic category;
@dynamic exprieDate;
@dynamic location;
@dynamic name;
@dynamic price;
@dynamic photos;

@end
