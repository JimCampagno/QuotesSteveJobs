//
//  SJQAPIClient.m
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "SJQAPIClient.h"
#import "SJQConstants.h"
#import <Firebase.h>


@interface SJQAPIClient ()

@end

@implementation SJQAPIClient

+ (void)downloadImageAtUrl:(NSURL *)url
            withCompletion:(void (^)(UIImage *image, BOOL success))block {
    NSLog(@"downloadImageAtUrl:");
    NSURLSessionDownloadTask *downloadPhotoTask =
    [[NSURLSession sharedSession] downloadTaskWithURL:url
                                    completionHandler:^(NSURL * _Nullable location,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error) {
                                        if (!error) {
                                            NSLog(@"no error in downloading image.");
                                            UIImage *downloadImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
                                            block(downloadImage, YES);
                                        } else {
                                            NSLog(@"Error in downloadImageAtUrl:withCompletion: method");
                                            NSLog(@"Error Message: %@", error.localizedDescription);
                                            block(nil, NO);
                                        }
                                    }];
    
    [downloadPhotoTask resume];
}


@end
