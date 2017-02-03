//
//  NavigationManager.m
//  TwitterDemo
//
//  Created by  Li Yang on 2/2/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "NavigationManager.h"
#import "User.h"

@interface NavigationManager ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation NavigationManager


+(instancetype) sharedInstance {
    static NavigationManager *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NavigationManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype) init {
    //check if a user already logged in
    //TODO: got 403 error
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//    UIViewController *root;
//    if ([defaults objectForKey:@"currentUser"]) {
//        root = [self twsListVC];
//    }else {
//        root = [self loginVC];
//    }
    
    UIViewController *root = [self loginVC];
    self.navigationController = [[UINavigationController alloc] init];
    self.navigationController.viewControllers = @[root];
    [self.navigationController setNavigationBarHidden:YES];
    
    return self;
}

- (UIViewController *)twsListVC
{
    // Create root VC for the tab's navigation controller
    TwsListViewController *vc = [[TwsListViewController alloc] initWithNibName:@"TwsListViewController" bundle:nil];
//    vc.title = @"Tweets List";
    
    // create tab item
//    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"Logged In" image:nil tag:0];
//    vc.tabBarItem = item;
    
    
    // create navigation controller
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];

    [navController.navigationBar setBarTintColor:[UIColor blueColor]];
   
    UINavigationItem *barItem = [[UINavigationItem alloc]init];
    UIBarButtonItem *signOutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(performSegueToTwsList)];
    barItem.rightBarButtonItem = signOutBtn;
    
    //TODO: find out why it doesn't work
    navController.navigationItem.rightBarButtonItem = signOutBtn;
    
    // create tab bar view controller
    UITabBarController *tabController = [[UITabBarController alloc] init];
    // Add navigation controller to tab bar controller
    tabController.viewControllers = @[navController];
    
    return tabController;
}

- (UIViewController *)loginVC
{
    LoginViewController *vc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    
    return vc;
}

-(void) performSegueToLogin {
    NSArray *vcs = @[[self loginVC]];
    [self.navigationController setViewControllers:vcs];

}

-(void) performSegueToTwsList {
    NSArray *vcs = @[[self twsListVC]];
    [self.navigationController setViewControllers:vcs];

}

- (UIViewController *)rootViewController
{
    return self.navigationController;
}



@end
