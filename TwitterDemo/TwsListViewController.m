//
//  TwsListViewController.m
//  TwitterDemo
//
//  Created by  Li Yang on 1/30/17.
//  Copyright © 2017 Li Yang. All rights reserved.
//

#import "TwsListViewController.h"
#import "TweetTableViewCell.h"


@interface TwsListViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TwsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    UINib *nib =[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TweetTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //todo
    TweetTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:@"TweetTableViewCell" forIndexPath:indexPath];
    
    if (indexPath.row % 2){
        cell.reTweetContainerHeightConstraint.constant = 0;
    }else {
        cell.reTweetContainerHeightConstraint.constant = 24;
    }
    
    return cell;
}


@end
