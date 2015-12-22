//
//  PointsVC.h
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckPoints.h"

@interface PointsVC : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    CheckPoints *points;
}

@property (weak, nonatomic) IBOutlet UITableView *pointsTable;

@end