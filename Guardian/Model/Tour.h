//
//  Tour.h
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Check.h"

@interface Tour : NSObject

-(void)addCheck:(Check*)check;

@property int TourId;
@property NSDate *StartTime;
@property NSMutableArray *Checks;

@end
