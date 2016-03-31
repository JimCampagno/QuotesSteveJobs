//
//  SJQAPIClient.m
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "SJQAPIClient.h"
#import "SJQConstants.h"

@interface SJQAPIClient ()

@end

@implementation SJQAPIClient

+ (void)downloadImageAtUrl:(NSURL *)url
            withCompletion:(void (^)(UIImage *image, BOOL success))block {
    NSURLSessionDownloadTask *downloadPhotoTask =
    [[NSURLSession sharedSession] downloadTaskWithURL:url
                                    completionHandler:^(NSURL * _Nullable location,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error) {
                                        if (!error) {
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

////1
//NSURL *url = [NSURL URLWithString:
//              @"http://upload.wikimedia.org/wikipedia/commons/7/7f/Williams_River-27527.jpg"];
//
//// 2
//NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
//                                               downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
//                                                   // 3
//                                                   UIImage *downloadedImage = [UIImage imageWithData:
//                                                                               [NSData dataWithContentsOfURL:location]];
//                                               }];
//
//// 4
//[downloadPhotoTask resume];

@end
