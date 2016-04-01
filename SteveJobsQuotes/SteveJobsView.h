//
//  SteveJobsView.h
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJQQuote.h"
@interface SteveJobsView : UIView

@property (strong, nonatomic) SJQQuote *quote;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
