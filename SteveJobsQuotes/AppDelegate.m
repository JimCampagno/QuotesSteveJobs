//
//  AppDelegate.m
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "AppDelegate.h"
#import <HTMLReader.h>
#import "NSString+EmojiExtension.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self wikipediaQuoteAPItest];
    
    return YES;
}

- (void)wikipediaQuoteAPItest {
    
    NSMutableDictionary *people = [NSMutableDictionary new];
    
    //    NSString *searchQuery = @"A_Bug%27s_Life";
    //    NSString *urlString = [NSString stringWithFormat:@"http://en.wikiquote.org/w/api.php?format=json&action=parse&page=%@&prop=text", searchQuery];
    
    NSString *urlString = @"https://en.wikipedia.org/wiki/Star_Wars_(film)";
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask =
    [session dataTaskWithRequest:request
               completionHandler:^(NSData * _Nullable data,
                                   NSURLResponse * _Nullable response,
                                   NSError * _Nullable error) {
                   NSString *contentType = nil;
                   if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                       NSDictionary *headers = [(NSHTTPURLResponse *)response allHeaderFields];
                       contentType = headers[@"Content-Type"];
                   }
                   
                   HTMLDocument *home = [HTMLDocument documentWithData:data
                                                     contentTypeHeader:contentType];
                   
                   NSArray *elements = [[home.rootElement children] array];
                   NSString *character;
                   
                   
                   for (HTMLElement *testNode in home.treeEnumerator) {
                       if ([testNode isKindOfClass:[HTMLElement class]] && [[HTMLSelector selectorForString:@"img"] matchesElement:testNode]) {
                           
                           NSString *altValue = [testNode.attributes[@"class"] lowercaseString];
                           if ([altValue containsString:@"thumbborder"]) {
                               NSString *srcsetValue = testNode[@"srcset"];
                               NSString *imageURL = [srcsetValue componentsSeparatedByString:@" "].firstObject;
                               NSLog(@"%@", imageURL);
                               break;
                           }
                           
                           
                       }
                   }
                   
                   for (HTMLElement *element in elements) {
                       for (HTMLElement *node in element.children) {
                           
                           if ([self isHeading2HTMLElement:node]) {
                               character = [node.textContent stringByReplacingOccurrencesOfString:@"[edit]"
                                                                                       withString:@""];
                               [people setObject:[@[] mutableCopy]
                                          forKey:character];
                               
                           } else if ([self isUnorderedListHTMLElement:node]) {
                               
                               NSString *thing = node.textContent;
                               NSArray *quotes = [thing componentsSeparatedByString:@"\\n"];
                               
                               for (NSInteger i = 0; i < quotes.count; i++) {
                                   NSString *quote = quotes[i];
                                   
                                   NSRange range;
                                   NSRange otherRange;
                                   range = [quote rangeOfString:@"\\u" options: NSBackwardsSearch];
                                   otherRange = [quote rangeOfString:@"\\U" options:NSBackwardsSearch];
                                   
                                   while (range.length != 0) {
                                       NSRange newRange = NSMakeRange(range.location, range.length + 4);
                                       quote = [quote stringByReplacingCharactersInRange:newRange
                                                                              withString:@" "];
                                       range = [quote rangeOfString:@"\\u" options: NSBackwardsSearch];
                                   }
                                   
                                   while (otherRange.length != 0) {
                                       NSRange newRange = NSMakeRange(range.location, range.length + 4);
                                       quote = [quote stringByReplacingCharactersInRange:newRange
                                                                              withString:@" "];
                                       range = [quote rangeOfString:@"\\U" options: NSBackwardsSearch];
                                   }
                                   
                                   
                                   
                                   quote = [quote stringByReplacingOccurrencesOfString:@"\\"
                                                                            withString:@""];
                                   
                                   
                                   
                                   if (quote.length >= 1) {
                                       [people[character] addObject:quote];
                                   }
                                   
                                   
                                   
                               }
                           }
                       }
                   }
                   
                   // NSLog(@"%@", people);
                   
               }];
    
    [dataTask resume];
}


- (BOOL)isUnorderedListHTMLElement:(HTMLElement *)element {
    return ([element isKindOfClass:[HTMLElement class]] && [[HTMLSelector selectorForString:@"ul"] matchesElement:element]);
}

- (BOOL)isHeading2HTMLElement:(HTMLElement *)element {
    return ([element isKindOfClass:[HTMLElement class]] && [[HTMLSelector selectorForString:@"h2"] matchesElement:element]);
}

- (BOOL)isSpecificElementString:(NSString *)string withElement:(HTMLElement *)element {
    return ([element isKindOfClass:[HTMLElement class]] && [[HTMLSelector selectorForString:string] matchesElement:element]);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
