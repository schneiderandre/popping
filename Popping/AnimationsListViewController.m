//
//  AnimationsListViewController.m
//  Popping
//
//  Created by André Schneider on 10.05.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "AnimationsListViewController.h"

static NSString * const kCellIdentifier = @"cellIdentifier";

@interface AnimationsListViewController()
@property(nonatomic) NSArray *items;
@end

@implementation AnimationsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Popping";
    self.items = @[@"Button"];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:kCellIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
