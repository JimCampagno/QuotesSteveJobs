//
//  SJQQuote.h
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SJQQuote : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *text;

+ (instancetype)quoteFromString:(NSString *)string;

@end
