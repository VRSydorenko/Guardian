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
        
    }
    return self;
}

-(void)getTour
{
    if (currentTour == nil)
    {
        [self fetchTour];
    }
    else
    {
        [self.delegate onTourFetched:currentTour];
    }
}

- (void)fetchTour;
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
              
              // id
              int tourId = [[values objectForKey:@"id"] intValue];
              
              // points
              NSData *pointData = [values objectForKey:@"tourCheckpoints"];
              if (pointData != nil)
              {
                  NSMutableArray *points = [[NSMutableArray alloc] init];
                  for (NSDictionary *pointDict in pointData)
                  {
                      int checkId = [[pointDict objectForKey:@"id"] intValue];
                      
                      NSDictionary *checkpointData = [pointDict objectForKey:@"checkpoint"];
                      int actPointId = [[checkpointData objectForKey:@"id"] intValue];
                      NSString *pointName = [checkpointData objectForKey:@"name"];
                      
                      NSString *pointStatus = [pointDict objectForKey:@"status"];
                      NSString *pointTimeStr = [pointDict objectForKey:@"timestamp"];
                      if (pointTimeStr != nil && ![pointTimeStr isKindOfClass:[NSNull class]] && [pointTimeStr length] > 0)
                      {
                          NSDate *time = [[NSDate alloc] init]; // later
                      }
                      else {
                          pointTimeStr = @"";
                      }
                      NSString *pointComment = [pointDict objectForKey:@"comment"];
                      if (pointComment != nil && ![pointComment isKindOfClass:[NSNull class]] && [pointComment length] > 0)
                      {
                          pointComment = @""; // later
                      }
                      else {
                          pointComment = @"";
                      }
                      
                      CheckPoint *pt = [[CheckPoint alloc] init];
                      pt.Name = pointName;
                      
                      [points addObject:pt];
                  }
                  currentTour = [[Tour alloc] initWith:points];
                  [_delegate onTourFetched:(currentTour)];
              }
              //[[data objectForKey:@"id"] stringValue];
          }
        else
        {
            [_delegate onTourFetched:(nil)];
        }
      }];
    [task resume];
}

@end
