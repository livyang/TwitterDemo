//
//  TwsListViewController.m
//  TwitterDemo
//
//  Created by  Li Yang on 1/30/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "TwsListViewController.h"
#import "TweetTableViewCell.h"
#import "TwitterClient.h"
#import "NavigationManager.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "DetailTweetViewController.h"


@interface TwsListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray<Tweet *> *tweets;
//@property (nonatomic, strong) User *currentUser;

@end

@implementation TwsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    UINib *nib =[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TweetTableViewCell"];
    
    [self fetchTweets];
    
    //add pull to refresh
    self.tableView.refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.tableView.refreshControl];
    [self.tableView.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    
    
    
}

-(void) fetchTweets {
    //get currentUser and tweets and reload table data
    [[TwitterClient sharedInstance] fetchTimeline:^(NSArray *tweets, NSError *error) {
        if (!error) {
            self.tweets = tweets;
            [self.tableView reloadData];
        }
    }];
    
    [self.tableView.refreshControl endRefreshing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 0;
    
    if (self.tweets.count > 0) {
        numberOfRows = (self.tweets.count > 20)?20:self.tweets.count;
    }
        
    return numberOfRows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //todo
    TweetTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell" forIndexPath:indexPath];

    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];
    cell.Handle.text = [NSString stringWithFormat:@"@%@",tweet.user.name];
    cell.Name.text = tweet.user.screenName;
    [cell.profileImageView setImageWithURL:tweet.user.profileImageUrl];
    cell.Content.text = tweet.text;
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd.MM.YY HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"%@",dateString);
    
       // Get conversion to months, days, hours, minutes
    NSCalendarUnit unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    NSDateComponents *breakdownInfo = [[NSCalendar currentCalendar] components:unitFlags fromDate:tweet.timeCreated  toDate:currentDate  options:0];
    NSLog(@"Break down: %li min : %li hours : %li days : %li months: %li years", [breakdownInfo minute], [breakdownInfo hour], [breakdownInfo day], [breakdownInfo month], (long)[breakdownInfo year]);
    NSString *numYear = (breakdownInfo.year == 0?@"": [NSString stringWithFormat: @"%liy-",breakdownInfo.year]);
    NSString *numMon = (breakdownInfo.month == 0?@"": [NSString stringWithFormat: @"%lim-",breakdownInfo.month]);
    NSString *numDay = (breakdownInfo.day == 0?@"": [NSString stringWithFormat: @"%lid-",breakdownInfo.day]);
    NSString *numHour = (breakdownInfo.hour == 0?@"": [NSString stringWithFormat: @"%lih",breakdownInfo.hour]);
    
    NSString *tempStr = [NSString stringWithFormat:@"%@%@%@%@",numYear,numMon,numDay,numHour];
    NSLog(@"temp ts is %@", tempStr);

    NSString *ts = ([tempStr rangeOfString:@"-"].location != NSNotFound)?[tempStr substringToIndex:[tempStr rangeOfString:@"-"].location]:tempStr;

    NSLog(@"ts is %@", ts);
    
    cell.Timestamp.text = ts;
    
    if (indexPath.row % 2){
        cell.reTweetContainerHeightConstraint.constant = 0;
    }else {
        cell.reTweetContainerHeightConstraint.constant = 24;
    }
        
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Here!!!!!!");
    
    Tweet *tweet;
    NSLog(@"cell clicked %@",
          [self.tweets objectAtIndex:indexPath.row].text);
    // get model
    tweet = [self.tweets objectAtIndex:indexPath.row];
    
    DetailTweetViewController *detailViewController =  [[DetailTweetViewController alloc] initWithNibName:@"DetailTweetViewController" bundle:nil];
    
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
//    [navController.navigationBar setBarTintColor:[UIColor blueColor]];
    
    //TODO: why it is not visible
//    navController.navigationItem.hidesBackButton = NO;
//    navController.tabBarController.t
    
    detailViewController.model = tweet;
    NSLog(@"detail view controller is %@", detailViewController);
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
