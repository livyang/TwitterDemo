//
//  NewTweetViewController.m
//  TwitterDemo
//
//  Created by  Li Yang on 2/3/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "NewTweetViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "User.h"
#import "Utils.h"
#import "TwsListViewController.h"
#import "TwitterClient.h"

@interface NewTweetViewController ()

@end

static CFStringRef escapeChars = (CFStringRef) @":/?#[]@!$&'()*+,;=%";

@implementation NewTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
    
    User *user = [Utils getCachedCurrentUser];
    [self.profileImageView setImageWithURL:user.profileImageUrl];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myMethod)];
    [self.view addGestureRecognizer:tap];
}

- (void)myMethod {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tapCancelBtn:(id)sender {
//    TwsListViewController *twsListVC =  [[TwsListViewController alloc] initWithNibName:@"TwsListViewController" bundle:nil];
//    
//    [self.navigationController pushViewController:twsListVC animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)tapTweetBtn:(id)sender {
    NSString *tweetContent = self.tweetText.text;
    NSString *encodedContent = [tweetContent stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet] ];
    
    [[TwitterClient sharedInstance] postTweet:encodedContent completion:^(NSError *error) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
}


@end
