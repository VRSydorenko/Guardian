//
//  PointsVC.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "PointsVC.h"
#import "CheckPointTableCell.h"

@implementation PointsVC

-(void)viewDidLoad{
    points = [[CheckPoints alloc] init];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Check points";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[points get] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CheckPointTableCell* cell = [[CheckPointTableCell alloc] init];
    
    CheckPoint *point = [[points get] objectAtIndex:indexPath.row];
    
    cell.labelName.text = point.Name;
    
    return cell;
}

@end