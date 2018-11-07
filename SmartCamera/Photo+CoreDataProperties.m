//
//  Photo+CoreDataProperties.m
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "Photo+CoreDataProperties.h"

@implementation Photo (CoreDataProperties)

+ (NSFetchRequest<Photo *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
}

@dynamic comment;
@dynamic creationDate;
@dynamic id;
@dynamic image;
@dynamic label;
@dynamic property;
@dynamic expireDate;
@end
