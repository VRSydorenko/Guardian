//
//  PointsVC.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "ChecksVC.h"
#import "CheckPointTableCell.h"
#import "CheckVC.h"

@implementation ChecksVC

-(void)viewDidLoad{
    checks = [[NSMutableArray alloc] init];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Check points";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [checks count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CheckCellIdentifier";
    CheckPointTableCell *cell = (CheckPointTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[CheckPointTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Check *check = [checks objectAtIndex:indexPath.row];
    
    [cell.labelName setText:check.Point.Name];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueCheckCellToDetails"])
    {
        CheckVC *checkVC = (CheckVC*)segue.destinationViewController;
        NSIndexPath *selectedCellIndex = [_pointsTable indexPathForSelectedRow];
        checkVC.check = [checks objectAtIndex:selectedCellIndex.row];
    }
}

@end
