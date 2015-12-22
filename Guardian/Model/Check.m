//
//  Check.m
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "Check.h"

@implementation Check

-(id)initWith:(CheckPoint*) checkPoint
{
    self = [super init];
    
    if (self != nil)
    {
        self.Status = NOT_VISITED;
    }
    
    return self;
}

@end
