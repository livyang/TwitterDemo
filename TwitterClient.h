//
//  TwitterClient.h
//  TwitterDemo
//
//  Created by  Li Yang on 1/30/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import <BDBOAuth1SessionManager.h>
#import "User.h"
#import "Tweet.h"

@interface TwitterClient : BDBOAuth1SessionManager

+ (TwitterClient *)sharedInstance;

//- (void) getDataOnCompletion:(void (^)(User *user, NSArray *tweets, NSError *error))completion;
//
//- (void) openURL:(void (^)(User *user, NSArray *tweets, NSError *error))completion;

- (void) fetchTimeline:(void (^)(NSArray *tweets, NSError *error))completion;
- (void) fetchCurrentUser:(void (^)(User *user, NSError *error))completion;
- (void)login:(void (^)(NSError *error))completion;
- (void)handleOpenUrl:(NSURL *)url;

@end
