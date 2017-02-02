//
//  User.m
//  TwitterDemo
//
//  Created by  Li Yang on 1/31/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithDictionary: (NSDictionary *)dict{
    self =  [super init];
    
    if (self) {
        self.name = dict[@"name"];
        self.screenName = dict[@"screen_name"];
        if (dict[@"profile_image_url_https"]) {
            self.profileImageUrl = [NSURL URLWithString:dict [@"profile_image_url_https"]];
        }
        self.desc = dict[@"description"];
    }
    
    return self;
}


@end
