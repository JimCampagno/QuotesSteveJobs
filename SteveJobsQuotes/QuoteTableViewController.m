//
//  QuoteTableViewController.m
//  SteveJobsQuotes
//
//  Created by Jim Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "QuoteTableViewController.h"
#import "QuoteTableViewCell.h"
#import "SJQPerson.h"
#import "QuoteView.h"
#import <Firebase.h>

@interface QuoteTableViewController () <QuoteViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *data; // Key: NSIndexPath, Value: SJQPerson

@end

@implementation QuoteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [NSMutableDictionary new];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)setupFirebaseReference {
    Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://stevejobsquotes.firebaseio.com"];
    
    [myRootRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        // value is a property of type id on the FDataSnapshot object. (it can only be one of these)
        // Data types that value can be are:
        // * NSDictionay -- NSDictionary *data = snapshot.value;
        // * NSArray -- NSArrray *data = snapshot.value;
        // * NSNumber (also includes booleans) -- NSNumber *data = snapshot.value;
        // * NSString -- NSString *data = snapshot.value;
        
    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"quoteCell"
                                                               forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    QuoteTableViewCell *quoteCell = (QuoteTableViewCell *)cell;
    if (!quoteCell.quoteView.delegate) {
        quoteCell.quoteView.delegate = self;
    }
    
    SJQPerson *person = self.people[indexPath.row];
    
    if (!self.data[person.uniqueID]) {
        self.data[person.uniqueID] = indexPath;
    }

    quoteCell.quoteView.person = person;
}

- (void)quoteButtonTappedForPerson:(SJQPerson *)person
                            sender:(id)sender {
    
    
}
- (BOOL)canUpdateImageViewWithQuoteView:(QuoteView *)sender {
    SJQPerson *person = sender.person;
    NSIndexPath *indexPath = self.data[person.uniqueID];
    return [self.tableView.indexPathsForVisibleRows containsObject:indexPath];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
