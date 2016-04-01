//
//  ViewController.m
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "ViewController.h"
#import "SJQConstants.h"
#import "SteveJobsView.h"
#import "SJQQuote.h"
#import <Firebase.h>


@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *quotes; //of SJQQuote's
@property (nonatomic, strong) NSArray *steveViews; //of SteveJobsView's

@property (weak, nonatomic) IBOutlet SteveJobsView *steveView1;
@property (weak, nonatomic) IBOutlet SteveJobsView *steveView2;
@property (weak, nonatomic) IBOutlet SteveJobsView *steveView3;
@property (weak, nonatomic) IBOutlet SteveJobsView *steveView4;
@property (weak, nonatomic) IBOutlet SteveJobsView *steveView5;
@property (weak, nonatomic) IBOutlet SteveJobsView *steveView6;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFirebaseReference];
    self.quotes = [NSMutableArray new];
    self.steveViews = @[self.steveView1, self.steveView2, self.steveView3, self.steveView4, self.steveView5, self.steveView6];
}

- (void)setupFirebaseReference {
    
    Firebase *myRootRef = [[Firebase alloc] initWithUrl:@"https://stevejobsquotes.firebaseio.com"];
    
    [myRootRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
        NSArray *quotes = snapshot.value[@"quotes"];
        
        for (NSString *string in quotes) {
            SJQQuote *newQuote = [SJQQuote quoteFromString:string];
            [self.quotes addObject:newQuote];
        }
        
        [self setupQuoteViews];
    }];
}

- (void)setupQuoteViews {
    for (NSInteger i = 0; i < self.quotes.count; i++) {
        SJQQuote *quote = self.quotes[i];
        SteveJobsView *view = self.steveViews[i];
        view.quote = quote;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"tableViewSegue"]) {
        
        
    }
    
}



@end