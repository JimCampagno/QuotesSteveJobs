//
//  QuoteTableViewCell.h
//  SteveJobsQuotes
//
//  Created by Jim Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuoteView.h"

@interface QuoteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet QuoteView *quoteView;

@end
