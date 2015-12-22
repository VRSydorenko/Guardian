//
//  DataManager.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "DataManager.h"
#import "CheckPoint.h"

@implementation DataManager

-(id)init
{
    if (self = [super init])
    {
        currentTour = [self fetchTour];
    }
    return self;
}

-(Tour*)getTour
{
    return currentTour;
}

- (Tour*)fetchTour;
{
    __block Tour *tour;
    
    NSString *strURL = @"http://hack.innofriends.at:8080/tour";
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *result = [strURL stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    NSURL *url = [NSURL URLWithString:result];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *connectionError)
    {
          if (data.length > 0 && connectionError == nil)
          {
              NSDictionary *values = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:0
                                                                         error:NULL];
              values;
              NSMutableArray *points = [[NSMutableArray alloc] init];
              for (int i = 0; i < 5; i++)
              {
                  CheckPoint *point = [[CheckPoint alloc] init];
                  point.Name = @"Name from data";
              }
              
              tour = [[Tour alloc] initWith:points];
              
              //[[data objectForKey:@"id"] stringValue];
          }
      }];
    [task resume];
    
    return tour;
}

@end
