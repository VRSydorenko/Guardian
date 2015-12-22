//
//  PointsVC.h
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChecksVC : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *checks;
}

@property (weak, nonatomic) IBOutlet UITableView *pointsTable;

@end
