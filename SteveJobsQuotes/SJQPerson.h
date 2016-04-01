//
//  SJQPerson.h
//  SteveJobsQuotes
//
//  Created by Jim Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SJQPerson : NSObject

@property (nonatomic, strong) NSMutableArray *quotes; //of SJQQuotes
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *knownFor;
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)personFromDictionary:(NSDictionary *)dict;
- (void)getImageFromURLwithCompletion:(void (^)(BOOL success))block;

@end
