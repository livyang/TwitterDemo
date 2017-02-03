//
//  TweetTableViewCell.m
//  TwitterDemo
//
//  Created by  Li Yang on 1/30/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "TweetTableViewCell.h"

@interface TweetTableViewCell ()

//@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
//@property (weak, nonatomic) IBOutlet UILabel *Name;
//@property (weak, nonatomic) IBOutlet UILabel *Handle;
//@property (weak, nonatomic) IBOutlet UILabel *Timestamp;
//@property (weak, nonatomic) IBOutlet UILabel *Content;

@end

@implementation TweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.Name.text = @"My twitter name";
    self.Handle.text = @"@LiYang";
    self.Timestamp.text = @"4h";
    self.Content.text = @"HIHIHIH this is really a repeated message, it is very interesting and funny, it is very looooooooong";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
