//
//  QuoteView.h
//  SteveJobsQuotes
//
//  Created by Jim Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJQPerson.h"

@protocol QuoteViewDelegate <NSObject>

- (void)quoteButtonTappedForPerson:(SJQPerson *)person
                            sender:(id)sender;
- (BOOL)canUpdateImageViewWithQuoteView:(id)sender;

@end

@interface QuoteView : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *knownForLabel;
@property (strong, nonatomic) SJQPerson *person;
@property (weak, nonatomic) id <QuoteViewDelegate> delegate;

@end


