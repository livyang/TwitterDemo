//
//  Tweet.h
//  TwitterDemo
//
//  Created by  Li Yang on 1/31/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timeCreated;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSNumber *retweet_count;
@property (nonatomic, strong) NSNumber *favorite_count;


-(id) initWithArray: (NSArray *) dict;

+ (NSArray *) tweetsWithArray:(NSArray *)tweets;

@end
