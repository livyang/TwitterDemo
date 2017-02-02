//
//  User.h
//  TwitterDemo
//
//  Created by  Li Yang on 1/31/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSURL *profileImageUrl;
@property (nonatomic, strong) NSString *desc;

- (id) initWithDictionary: (NSDictionary *)dict;

@end
