//
//  Utils.m
//  TwitterDemo
//
//  Created by  Li Yang on 2/2/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (void)cacheCurrentUser:(NSDictionary *) userDict {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSError *error;
    
    NSData *userData = [NSJSONSerialization dataWithJSONObject:userDict options:NSUTF8StringEncoding error:&error];
    
    if (userData) {
        [defaults setObject:userData forKey:@"currentUser"];
    }/*else {
        [defaults setObject:nil forKey:@"currentUser"];
    }*/
    [defaults synchronize];
}

+ (User *) getCachedCurrentUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSError *error;
    User *user;
    
    NSData *userData = [defaults objectForKey:@"currentUser"];
    
    if (userData) {
        NSDictionary *userDict = [NSJSONSerialization JSONObjectWithData:userData options:(NSUTF8StringEncoding) error:&error];
        
        user =  [[User alloc] initWithDictionary:userDict];
        
    }
    return user;
}

@end
