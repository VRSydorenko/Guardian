//
//  Check.h
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckPoint.h"

#define NOT_VISITED @"NOT_VISITED"
#define OK @"OK"
#define NOK @"NOK"

@interface Check : NSObject

@property int CheckId;
@property CheckPoint *Point;
@property NSString *Comment;
@property NSDate *CheckDate;
@property NSString *Status;

-(id)initWith:(CheckPoint*)checkPoint;

@end
