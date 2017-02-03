//
//  DetailTweetViewController.m
//  TwitterDemo
//
//  Created by  Li Yang on 2/2/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "DetailTweetViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface DetailTweetViewController ()
//@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
//@property (weak, nonatomic) IBOutlet UILabel *NameAndHandleLabel;
//@property (weak, nonatomic) IBOutlet UILabel *userDescLabel;
//@property (weak, nonatomic) IBOutlet UILabel *TweetContentLabel;
//@property (weak, nonatomic) IBOutlet UIButton *replyBtn;
//@property (weak, nonatomic) IBOutlet UIButton *retweetBtn;
//@property (weak, nonatomic) IBOutlet UIButton *favoriteBtn;

@end

@implementation DetailTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.NameAndHandleLabel.text = @"Li Yang@lyang";
    self.userDescLabel.text = @"Here is a long description of Li Yang. Yeaaaaaah";
    self.TweetContentLabel.text = @"This is the tweet content, this is the tweet content, this is the tweet content, this is the tweet content";
    
    //TODO: using model to populate the labels
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
