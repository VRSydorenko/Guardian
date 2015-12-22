//
//  Check.h
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckPoint.h"

#define NotVisited 0
#define OK 1
#define NOK 2

@interface Check : NSObject
{
    CheckPoint *Point;
    NSString *Comment;
    NSDate *CheckDate;
    int Status;
}

-(id)initWith:(CheckPoint*) checkPoint;

@end
