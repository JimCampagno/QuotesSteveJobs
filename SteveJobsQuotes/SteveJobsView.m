//
//  SteveJobsView.m
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "SteveJobsView.h"

@implementation SteveJobsView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [[NSBundle mainBundle] loadNibNamed:@"SteveJobsView" owner:self options:nil];
    
    [self addSubview:self.contentView];

    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [self.contentView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.contentView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    
    self.imageView.alpha = 0.0;
    self.textView.alpha = 0.0;
}

- (void)setQuote:(SJQQuote *)quote {
    _quote = quote;
    [self updateContent];
}

- (void)updateContent {
    self.imageView.image = self.quote.image;
    self.textView.text = self.quote.text;
    
    [UIView animateWithDuration:0.8
                     animations:^{
                         self.imageView.alpha = 1.0;
                         self.textView.alpha = 1.0;
                     }];
}

@end
