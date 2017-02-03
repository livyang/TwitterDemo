//
//  NavigationManager.h
//  TwitterDemo
//
//  Created by  Li Yang on 2/2/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "TwsListViewController.h"

@interface NavigationManager : NSObject

+ (instancetype) sharedInstance;

- (UIViewController *)rootViewController;

- (void)performSegueToTwsList;
- (void)performSegueToLogin;


@end
