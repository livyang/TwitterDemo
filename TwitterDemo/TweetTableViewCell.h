//
//  TweetTableViewCell.h
//  TwitterDemo
//
//  Created by  Li Yang on 1/30/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *reTweetContainerHeightConstraint;

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Handle;
@property (weak, nonatomic) IBOutlet UILabel *Timestamp;
@property (weak, nonatomic) IBOutlet UILabel *Content;


@end
