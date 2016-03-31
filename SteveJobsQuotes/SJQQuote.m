//
//  SJQQuote.m
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "SJQQuote.h"
#import <GameKit/GameKit.h>

@implementation SJQQuote

+ (instancetype)quoteFromString:(NSString *)string {
    SJQQuote *quote = [SJQQuote new];
    quote.text = string;
    quote.image = [SJQQuote generateRandomImage];
    return quote;
}

+ (UIImage *)generateRandomImage {
    NSUInteger randomNumber = [[GKRandomSource sharedRandom] nextIntWithUpperBound:5];
    NSString *randomNumberString = [@(randomNumber +1) stringValue];
    NSString *randomImageName = [NSString stringWithFormat:@"Steve%@", randomNumberString];
    UIImage *image = [UIImage imageNamed:randomImageName];
    return image;
}

@end
