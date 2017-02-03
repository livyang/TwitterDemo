//
//  LoginViewController.m
//  TwitterDemo
//
//  Created by  Li Yang on 2/2/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "LoginViewController.h"
#import "NavigationManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    TwitterClient *clent = [TwitterClient sharedInstance];
//    [clent login:^(NSError *error) {
//        //perform segue
//        
//        
//        if (!error) {
//            [clent fetchCurrentUser:^(User *user, NSError *error) {
//                NSLog(@"user is %@", [user name]);
//            }];
//            [clent fetchTimeline:^(NSArray *tweets, NSError *error) {
//                for (Tweet *aTweet in tweets) {
//                    NSLog(@"tweet: %@", aTweet.text);
//                };
//            }];
//        };
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTapLogin:(id)sender {
    [[TwitterClient sharedInstance] login:^(NSError *error) {
        //perform segue
        NSLog(@"I have logged");
        [[NavigationManager sharedInstance]  performSegueToTwsList];

    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
