//
//  Tour.m
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "Tour.h"

@implementation Tour

-(id)init
{
    if (self = [super init])
    {
        self.Checks = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addCheck:(Check*)check
{
    [self.Checks addObject:check];
}

@end
