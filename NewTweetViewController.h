//
//  NewTweetViewController.h
//  TwitterDemo
//
//  Created by  Li Yang on 2/3/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTweetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIButton *CancelBtn;
@property (weak, nonatomic) IBOutlet UITextView *contentBtn;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;

@end
