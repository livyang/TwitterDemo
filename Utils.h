//
//  Utils.h
//  TwitterDemo
//
//  Created by  Li Yang on 2/2/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Utils : NSObject

+ (void)cacheCurrentUser:(NSDictionary *) userDict;

+ (User *) getCachedCurrentUser;

@end
