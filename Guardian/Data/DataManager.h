//
//  DataManager.h
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tour.h"

@protocol RemoteDataDelegate <NSObject>
-(void)onTourFetched:(Tour*)tour;
@end

@interface DataManager : NSObject
{
    Tour *currentTour;
    bool requestInProgress;
}

@property id<RemoteDataDelegate> delegate;

-(void)getTour;

@end
