//
//  QuoteView.m
//  SteveJobsQuotes
//
//  Created by Jim Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "QuoteView.h"
#import "SJQAPIClient.h"

@implementation QuoteView


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
    
    NSLog(@"commonInit:");
    
    [[NSBundle mainBundle] loadNibNamed:@"QuoteView" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [self.contentView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.contentView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    
    self.imageView.alpha = 0.0;
}

- (void)setPerson:(SJQPerson *)person {
    NSLog(@"setPerson:");
    _person = person;
    self.nameLabel.text = person.name;
    self.quoteLabel.text = [NSString stringWithFormat:@"%ld Quotes", person.quotes.count];
    self.knownForLabel.text = person.knownFor;
    
    if (self.person.image) {
        self.imageView.image = self.person.image;
        self.imageView.alpha = 1.0;
    } else {
        self.imageView.image = nil;
        [self.person getImageFromURLwithCompletion:^(BOOL success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                BOOL isOKtoUpdateImageView = success && [self.delegate canUpdateImageViewWithQuoteView:self];
                if (isOKtoUpdateImageView) {
                    self.imageView.image = self.person.image;

                    [UIView animateWithDuration:0.8 animations:^{
                        self.imageView.alpha = 1.0;
                        
                    }];
                }
            });
        }];
    }
}


- (IBAction)quoteButtonTapped:(id)sender {
    [self.delegate quoteButtonTappedForPerson:self.person
                                       sender:self];
}


@end
