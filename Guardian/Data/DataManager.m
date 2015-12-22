//
//  DataManager.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "DataManager.h"
#import "CheckPoint.h"

//#define SERVER @"http://localhost:8080/"
#define SERVER @"http://hack.innofriends.at:8080/"

@implementation DataManager

-(void)getTour
{
    if (currentTour == nil)
    {
        NSString *url = [NSString stringWithFormat:@"%@tour", SERVER];
        [self fetchTour:url];
    }
    else
    {
        [self.delegate onTourFetched:currentTour];
    }
}

-(Tour*)getCurrentTour
{
    return currentTour;
}

-(void)startTour
{
    if (currentTour != nil)
    {
        return;
    }
    
    [self fetchTour:[NSString stringWithFormat:@"%@tour/start", SERVER]];
}

- (void)fetchTour:(NSString*)url;
{
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *result = [url stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    NSURL *nsUrl = [NSURL URLWithString:result];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsUrl];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *connectionError)
    {
        currentTour = nil;
        if (data.length > 0 && connectionError == nil)
        {
            currentTour = [[Tour alloc] init];
            
            NSDictionary *values = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
            // id
            currentTour.TourId = [[values objectForKey:@"id"] intValue];
              
            // start timestamp
            NSString *tourStartTime = [values objectForKey:@"startTime"];
            if (tourStartTime != nil && ![tourStartTime isKindOfClass:[NSNull class]])
            {
                currentTour.StartTime = [NSDate dateWithTimeIntervalSince1970:[tourStartTime longLongValue]];
            }
              
            // points
            NSData *pointData = [values objectForKey:@"tourCheckpoints"];
            if (pointData != nil)
            {
                for (NSDictionary *pointDict in pointData)
                {
                    Check* check = [[Check alloc] init];
                    
                    // check id
                    check.CheckId = [[pointDict objectForKey:@"id"] intValue];
                    
                    // check status
                    check.Status = [pointDict objectForKey:@"status"];
                      
                    // check timestamp
                    NSString *pointTimeStr = [pointDict objectForKey:@"timestamp"];
                    if (pointTimeStr != nil && ![pointTimeStr isKindOfClass:[NSNull class]])
                    {
                        check.CheckDate = [NSDate dateWithTimeIntervalSince1970:[pointTimeStr longLongValue]];
                    }
                      
                    // check comment
                    check.Comment = @"";
                    NSString *pointComment = [pointDict objectForKey:@"comment"];
                    if (pointComment != nil && ![pointComment isKindOfClass:[NSNull class]])
                    {
                        check.Comment = pointComment;
                    }
                      
                    // check point
                    CheckPoint *pt = [[CheckPoint alloc] init];
                    NSDictionary *checkpointData = [pointDict objectForKey:@"checkpoint"];
                    pt.PointId = [[checkpointData objectForKey:@"id"] intValue];
                    pt.Name = [checkpointData objectForKey:@"name"];
                    check.Point = pt;
                      
                    [currentTour addCheck:check];
                }
            }
          }
        [_delegate onTourFetched:(currentTour)];
      }];
    [task resume];
}

@end
