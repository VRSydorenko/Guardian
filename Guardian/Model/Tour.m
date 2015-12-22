//
//  Tour.m
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "Tour.h"
#import "CheckPoint.h"
#import "Check.h"

@implementation Tour

-(id)initWith:(NSMutableArray *) checkPoints
{
    self = [super init];
    
    if (self != nil)
    {
        _Checks = [[NSMutableArray alloc] init];
        for (CheckPoint *point in checkPoints)
        {
            Check *check = [[Check alloc] initWith:point];
            [_Checks addObject:check];
        }
    }
    
    return self;
    
}

@end
