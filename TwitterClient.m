//
//  TwitterClient.m
//  TwitterDemo
//
//  Created by  Li Yang on 1/30/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "TwitterClient.h"
#import "Utils.h"

NSString * const kTwitterConsumerKey = @"UzkX2yuGV5qTZjv2Jfd3KzOTm";
NSString * const kTwitterConsumerSecret = @"op0467NVJmTKXTE5EnLR3Dgp0KyFLC89bSKIGwNBHN8GClJ2S0";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";

@implementation TwitterClient


void (^loginCompletion)(NSError*);

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


- (void) fetchTimeline:(void (^)(NSArray *tweets, NSError *error))completion  {
    [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"timeline request in progress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"timeline request succeeded");
        NSLog(@"tweets are %@", responseObject);
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        completion(tweets, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"timeline request failed with error %@", error.description);
        completion(nil, error);
    }];

}

- (void) fetchCurrentUser:(void (^)(User *user, NSError *error))completion  {
    [[TwitterClient sharedInstance] GET:@"1.1/account/verify_credentials.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"verify credentials request in progress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"verify credentials request succeeded");
//        NSLog(@"current user is %@", responseObject);
        
        User *user =[[User alloc] initWithDictionary:responseObject];
        
        //cache user in NSUserDefaults
        [Utils cacheCurrentUser:responseObject];
        
        completion(user, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"verify credentials request failed with error %@", error.description);
        completion(nil, error);
    }];
}

- (void)login:(void (^)(NSError *error))completion{
    loginCompletion = completion;
    [[TwitterClient sharedInstance].requestSerializer removeAccessToken];
    [[TwitterClient sharedInstance] fetchRequestTokenWithPath:@"oauth/request_token" method:@"GET" callbackURL:[NSURL URLWithString:@"twitterdemo://oauth"] scope:nil success:^(BDBOAuth1Credential *requestToken) {
        NSLog(@"got the request token");
        NSURL *authUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@",requestToken.token]];
        [[UIApplication sharedApplication] openURL:authUrl options:[[NSDictionary alloc]init] completionHandler:^(BOOL success) {
            if (!success) {
                NSLog(@"failed to open twitter Authorize URL ");
                completion([[NSError alloc] init]);
            }else {
                //let handleOpenUrl call completion once login is fully completed
//                completion(nil);
            }
        }];
    } failure:^(NSError *error) {
        NSLog(@"failed to get the request token");
        completion(error);
    }];;

}

- (void)handleOpenUrl:(NSURL *)url {
    [[TwitterClient sharedInstance] fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[BDBOAuth1Credential credentialWithQueryString:url.query] success:^(BDBOAuth1Credential *accessToken) {
        NSLog(@"got access token");
        //call self loginSuccess
        
        [[TwitterClient sharedInstance] fetchCurrentUser:^(User *user, NSError *error) {
            if (!error) {
                loginCompletion(nil);
            }else {
                NSLog(@"failed to get current user with %@", error.description);
            }
        }];
    } failure:^(NSError *error) {
        NSLog(@"failed to get access token");
        loginCompletion(error);
    }];
}


@end
