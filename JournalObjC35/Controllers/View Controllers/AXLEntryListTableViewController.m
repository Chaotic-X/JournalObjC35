//
//  AXLEntryListTableViewController.m
//  JournalObjC35
//
//  Created by Alex Lundquist on 8/10/20.
//  Copyright © 2020 Alex Lundquist. All rights reserved.
//

#import "AXLEntryListTableViewController.h"
#import "AXLEntry.h"
#import "AXLEntryController.h"
#import "AXLEntryDetailViewController.h"

@interface AXLEntryListTableViewController ()

@end

@implementation AXLEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.tableView reloadData];
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
  return AXLEntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
  AXLEntry * entry = AXLEntryController.sharedInstance.entries[indexPath.row];
  cell.textLabel.text = entry.title;
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  [dateFormatter setDateStyle:NSDateFormatterShortStyle];
  [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
  cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timeStamp];
  return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      AXLEntry * entry = AXLEntryController.sharedInstance.entries[indexPath.row];
      [[AXLEntryController sharedInstance] removeEntry:entry];
      [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"toDetailVC"]) {
    NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
    AXLEntryDetailViewController * destinationVC = [segue destinationViewController];
    AXLEntry * entryToSend = AXLEntryController.sharedInstance.entries[indexPath.row];
    destinationVC.entry = entryToSend;
  }
}
@end
