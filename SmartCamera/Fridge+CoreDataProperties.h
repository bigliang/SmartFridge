//
//  Fridge+CoreDataProperties.h
//  SmartCamera
//
//  Created by  shihongliang on 10/23/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//
//

#import "Fridge+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Fridge (CoreDataProperties)

+ (NSFetchRequest<Fridge *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *brand;

@end

NS_ASSUME_NONNULL_END
