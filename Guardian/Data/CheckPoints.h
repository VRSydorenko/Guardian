//
//  CheckPoints.h
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckPoint.h"

@interface CheckPoints : NSObject
{
     NSMutableArray *points;
}

-(NSArray*)get;

@end
