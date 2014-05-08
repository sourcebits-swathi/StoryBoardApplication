//
//  FDListViewController.m
//  FriendDetails
//
//  Created by Swathi Tata on 05/05/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//

#import "FDListViewController.h"
#import "FDDetailedViewController.h"
#import "FriendsList.h"

@interface FDListViewController ()
{
    FriendsList *dataForTableview;
}

@end

@implementation FDListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataForTableview = [FriendsList sharedInstance];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //When pop to this view  from previous view i am reloading table because there is a chance to change data in previous view
   [self.tableView reloadData];
}
#pragma mark - Moving to Detailed View Controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller
    FDDetailedViewController *detailedViewCtrl = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    detailedViewCtrl.descriptionText = [[dataForTableview.listOfFriends objectAtIndex:indexPath.row]objectForKey:@"where the person stays"];
    detailedViewCtrl.friendName = [[dataForTableview.listOfFriends objectAtIndex:indexPath.row]objectForKey:@"name"];

    detailedViewCtrl.selectedrow = indexPath.row;
   
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return dataForTableview.listOfFriends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [[dataForTableview.listOfFriends objectAtIndex:indexPath.row]objectForKey:@"name"];
    // Configure the cell...
    
    return cell;
}
#pragma mark - for app state preservation
-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
 //Preserving friends details
    [coder encodeObject:dataForTableview.listOfFriends forKey:@"DataForTableview"];
    [super encodeRestorableStateWithCoder:coder];
    
}

#pragma mark - for app state restore
-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
 
//Restoring friends details

dataForTableview.listOfFriends = [coder decodeObjectForKey:@"DataForTableview"];
[super decodeRestorableStateWithCoder:coder];
   
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */



@end
