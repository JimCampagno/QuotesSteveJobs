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
#import <AFNetworking.h>
#import <Ono.h>
#import <AFOnoResponseSerializer.h>

@interface QuoteTableViewController () <QuoteViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic, strong) NSMutableArray *wikiQuoteData;

@end

@implementation QuoteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _people = [NSMutableArray new];
    _data = [NSMutableDictionary new];
    _wikiQuoteData = [NSMutableArray new];
    [self setupFirebaseReference];
    
    NSString *urlString = @"https://en.wikiquote.org/wiki/Rocky_(film)";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFOnoResponseSerializer HTMLResponseSerializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, ONOXMLDocument *responseDocument) {
        
        for (ONOXMLElement *element in [responseDocument CSS:@"li"]) {
            BOOL hasStringValue = element.stringValue != nil;
            BOOL isValidLine = [element.description containsString:@"<li>"];
            BOOL isCastListing = [element.description containsString:@"<li><a href="];
            
            if (hasStringValue & isValidLine) {
                // The cast listing begins at the end of the page. I'm using break and not continue because when the cast listing begins, there are no more quotes to supply. What distinguishes the cast listing from the beginning of the link to the end is the href (which is why I'm locating it within the string)
                if (isCastListing) {
                    break;
                }
                
                [self.wikiQuoteData addObject:element.stringValue];
            }
        }
        
        for (NSString *quote in self.wikiQuoteData) {
            NSLog(@"%@\n\n\n\n\n", quote);
        }
        
    } failure:nil];
    
    
    
    
    
}


- (void)setupFirebaseReference {
    Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://stevejobsquotes.firebaseio.com"];
    
    [myRootRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        NSArray *people = snapshot.value[@"people"];
        
        for (NSDictionary *person in people) {
            SJQPerson *currentPerson = [SJQPerson personFromDictionary:person];
            [self.people addObject:currentPerson];
        }
        
        [self.tableView reloadData];
        
    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"tableView:numberOfRowsInSection:");
    return self.people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView:cellForRowAtIndexPath:");
    QuoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"quoteCell"
                                                               forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"tableView:willDisplayCell:forRowAtIndexPath:");
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
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
