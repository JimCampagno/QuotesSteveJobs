//
//  SJQAPIClient.h
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SJQAPIClient : NSObject

+ (void)downloadImageAtUrl:(NSURL *)url
            withCompletion:(void (^)(UIImage *image, BOOL success))block;

@end
