//
//  foodMenu.m
//  SmartCamera
//
//  Created by  shihongliang on 11/17/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import "foodMenu.h"

@implementation foodMenu
@synthesize title;
@synthesize category;
@synthesize descript;
- (id) initWithTitle:(NSString*) title catergory:(NSString*) category descript:
(NSString*) descript {
    if ( self = [super init]) {
        self.title = title;
        self.category = category;
        self.descript = descript;
    }
    return self;
}
@end
