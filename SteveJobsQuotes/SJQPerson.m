//
//  SJQPerson.m
//  SteveJobsQuotes
//
//  Created by Jim Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "SJQPerson.h"
#import "SJQAPIClient.h"


@implementation SJQPerson

+ (instancetype)personFromDictionary:(NSDictionary *)dict {
    SJQPerson *person = [SJQPerson new];
    
    person.name = dict[@"name"];
    person.knownFor = dict[@"knownFor"];
    person.imageURL = [NSURL URLWithString:dict[@"imageURL"]];
    
    NSArray *quotes = dict[@"quotes"];
    for (NSString *quote in quotes) {
        [person.quotes addObject:quote];
    }
    
    return person;
}

- (void)getImageFromURLwithCompletion:(void (^)(BOOL success))block {
    [SJQAPIClient downloadImageAtUrl:self.imageURL
                      withCompletion:^(UIImage *image, BOOL success) {
                          
                          dispatch_async(dispatch_get_main_queue(), ^{
                              if (success) {
                                  self.image = image;
                                  block(YES);
                              } else {
                                  block(NO);
                              }
                              
                          });
                      }];
}



@end
