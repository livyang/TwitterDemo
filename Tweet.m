//
//  Tweet.m
//  TwitterDemo
//
//  Created by  Li Yang on 1/31/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "Tweet.h"
#import "User.h"

@implementation Tweet

-(id) initWithDictionary: (NSDictionary *) dict {
    self = [super self];
    
    if (self) {
        self.text = dict[@"text"];
        self.user = [[User alloc] initWithDictionary:dict[@"user"]];
        
        NSString *timeCreatedString = dict[@"created_at"];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"EEE MMM d HH:mm:ss Z y"];
        NSDate *date = [dateFormat dateFromString:timeCreatedString];
        self.timeCreated = date;
        
        self.retweet_count = (dict[@"retweet_count"])?dict[@"retweet_count"]:0;
        self.favorite_count = (dict[@"favourite_count"])?dict[@"retweet_count"]:0;
    }
    
    return self;
}

+ (NSArray *) tweetsWithArray:(NSArray *)tweets{
    NSMutableArray *tweetsarr = [[NSMutableArray alloc]init];
    
    for (NSDictionary * dict in tweets) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dict];
        [tweetsarr addObject:tweet];
    }
    
    return tweetsarr;
    
}
@end
