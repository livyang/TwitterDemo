//
//  TwitterClient.m
//  TwitterDemo
//
//  Created by  Li Yang on 1/30/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "TwitterClient.h"

NSString * const kTwitterConsumerKey = @"UzkX2yuGV5qTZjv2Jfd3KzOTm";
NSString * const kTwitterConsumerSecret = @"op0467NVJmTKXTE5EnLR3Dgp0KyFLC89bSKIGwNBHN8GClJ2S0";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";

@implementation TwitterClient

+ (TwitterClient *)sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }

    });
    
    return instance;
}

@end
