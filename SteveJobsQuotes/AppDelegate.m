//
//  AppDelegate.m
//  SteveJobsQuotes
//
//  Created by James Campagno on 3/31/16.
//  Copyright © 2016 James Campagno. All rights reserved.
//

#import "AppDelegate.h"
#import <HTMLReader.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    //    NSString *urlString = @"https://en.wikiquote.org/wiki/Rocky_(film)";
//    NSString *urlString = @"http://en.wikiquote.org/w/api.php?format=json&action=parse&page=Rocky_(film)&prop=text";
//    
//    NSURL *url = [NSURL URLWithString:urlString];
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSURLSessionDataTask *dataTask =
//    [session dataTaskWithRequest:request
//               completionHandler:^(NSData * _Nullable data,
//                                   NSURLResponse * _Nullable response,
//                                   NSError * _Nullable error) {
//                   NSString *contentType = nil;
//                   //
//                   //
//                   //
//                   //          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
//                   //              NSDictionary *headers = [(NSHTTPURLResponse *)response allHeaderFields];
//                   //              contentType = headers[@"Content-Type"];
//                   //          }
//                   
//                   
//                   HTMLDocument *home = [HTMLDocument documentWithData:data
//                                                     contentTypeHeader:contentType];
//                   //          HTMLElement *div = [home firstNodeMatchingSelector:@"li"];
//                   NSArray *stuff = [home nodesMatchingSelector:@"li"];
//                   NSArray *allStuff = [home childElementNodes];
//                   
//                   
//                   for (HTMLElement *element in stuff) {
//                       
////                       NSLog(@"%@", element.description);
//                       
//                       if ([element.description containsString:@"<li>"]) {
//                           
//                           
//                           
//                           if ([element.description containsString:@"wikipedia.org"]) {
//                               
//                           }
//                           
//                           //                       NSLog(@"============================================\n");
//                           //                       NSLog(@"%@", element);
//                           //                       NSLog(@"%@", element.description);
//                           //                       NSLog(@"%@", element.textContent);
//                           //                       NSLog(@"============================================\n\n");
//                           
//                       }
//                       
//                       NSArray *children = [element.children array];
//                       NSLog(@"COUNT %ld", children.count);
//                       for (HTMLNode *node in children) {
//                           
////                           NSLog(@"%@", node);
//                       }
//                       //              }
//                       
//                       
//                   }
//                   
//                   
//                   
//                   
//                   
//                   NSError *jsonError;
//                   NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
//                                                                        options:kNilOptions
//                                                                          error:&jsonError];
//                   
//                   
//                   
//                   
//                   
//                   
//                   
//                   //
//                   //                   NSLog(@"What is json: %@", json);
//                   //                   NSLog(@"----------------------------");
//                   //                   NSLog(@"What is the response: %@", response);
//                   
//                   
//               }];
//    
//    [dataTask resume];
    
    
    //    // Parse a string and find an element.
    //    NSString *markup = @"<p><b>Ahoy there sailor!</b></p>";
    //    HTMLDocument *document = [HTMLDocument documentWithString:markup];
    //    NSLog(@"%@", [document firstNodeMatchingSelector:@"b"].textContent);
    //    // => Ahoy there sailor!
    //
    //    // Wrap one element in another.
    //    HTMLElement *b = [document firstNodeMatchingSelector:@"b"];
    //    NSMutableOrderedSet *children = [b.parentNode mutableChildren];
    //    HTMLElement *wrapper = [[HTMLElement alloc] initWithTagName:@"div"
    //                                                     attributes:@{@"class": @"special"}];
    //    [children insertObject:wrapper atIndex:[children indexOfObject:b]];
    //    b.parentNode = wrapper;
    //    NSLog(@"%@", [document.rootElement serializedFragment]);
    //    // => <html><head></head><body><p><div class="special"> \
    //    <b>Ahoy there sailor!</b></div></p></body></html>
    
    // Load a web page.
    //    NSURL *URL = [NSURL URLWithString:urlString];
    //    NSURLSession *session = [NSURLSession sharedSession];
    //    [[session dataTaskWithURL:URL completionHandler:
    //      ^(NSData *data, NSURLResponse *response, NSError *error) {
    //          NSString *contentType = nil;
    //
    //
    //
    //          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
    //              NSDictionary *headers = [(NSHTTPURLResponse *)response allHeaderFields];
    //              contentType = headers[@"Content-Type"];
    //          }
    //          HTMLDocument *home = [HTMLDocument documentWithData:data
    //                                            contentTypeHeader:contentType];
    ////          HTMLElement *div = [home firstNodeMatchingSelector:@"li"];
    //          NSArray *stuff = [home nodesMatchingSelector:@"li"];
    //
    //
    //
    //          for (HTMLElement *element in stuff) {
    ////              if ([element.description containsString:@"<li>"]) {
    //                  NSLog(@"============================================\n");
    //                  NSLog(@"%@", element);
    //                  NSLog(@"%@", element.description);
    //                  NSLog(@"%@", element.textContent);
    //                  NSLog(@"============================================\n\n");
    ////              }
    //
    //
    //          }
    //
    //
    //
    ////          NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    ////          NSLog(@"%@", [div.textContent stringByTrimmingCharactersInSet:whitespace]);
    //
    //
    //
    //          // => A WHATWG-compliant HTML parser in Objective-C.
    //      }] resume];
    
    
    
    
    
    
    
    //    TFHppleElement * element = [elements objectAtIndex:0];
    
    
    
    //    [e text];                       // The text inside the HTML element (the content of the first text node)
    //    [e tagName];                    // "a"
    //    [e attributes];                 // NSDictionary of href, class, id, etc.
    //    [e objectForKey:@"href"];       // Easy access to single attribute
    //    [e firstChildWithTagName:@"b"]; // The first "b" child node
    //
    
    return YES;
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
