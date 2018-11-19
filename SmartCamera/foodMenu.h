//
//  foodMenu.h
//  SmartCamera
//
//  Created by  shihongliang on 11/17/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface foodMenu : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString * category;
@property (nonatomic, strong) NSString * descript;
- (id) initWithTitle:(NSString*) title catergory:(NSString*) category descript:(NSString*) descript;
@end

NS_ASSUME_NONNULL_END
