//
//  CheckPoints.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "CheckPoints.h"

@implementation CheckPoints

-(NSDictionary*)get
{
    NSDictionary* points = [[NSDictionary alloc] init];
    
    CheckPoint *point1 = [[CheckPoint alloc] init];
    point1.Name = @"Receptoin";
    [points setValue:point1 forKey:@"1"];
    
    CheckPoint *point2 = [[CheckPoint alloc] init];
    point2.Name = @"WC";
    [points setValue:point2 forKey:@"2"];
    
    return points;
}

@end
