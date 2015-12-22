//
//  PointsVC.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "PointsVC.h"

@implementation PointsVC

-(void)viewDidLoad{
    points = [[CheckPoints alloc] init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[points get] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    
    CheckPoint *point = [[points get] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = point.Name;
    
    return cell;
}

@end
