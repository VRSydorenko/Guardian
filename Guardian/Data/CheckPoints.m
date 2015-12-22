//
//  CheckPoints.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "CheckPoints.h"

@implementation CheckPoints

-(id)init
{
    if (self = [super init])
    {
        points = [[NSMutableArray alloc] init];
        CheckPoint *point1 = [[CheckPoint alloc] init];
        point1.Name = @"Receptoin";
        [points addObject:point1];
        
        CheckPoint *point2 = [[CheckPoint alloc] init];
        point2.Name = @"WC";
        [points addObject:point2];
    }
    return self;
}

-(NSArray*)get
{
    return points;
}

@end
