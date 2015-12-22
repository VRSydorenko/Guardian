//
//  CheckVC.m
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "CheckVC.h"

@interface CheckVC ()

@end

@implementation CheckVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _labelName.text  = _check.Point.Name;
    _textComment.text = _check.Comment;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)OnOk:(id)sender {
    [self Save:OK];
}

- (IBAction)OnNok:(id)sender {
    [self Save:NOK];
}

-(void)Save:(int)status{
    _check.Status = status;
    _check.Comment = _textComment.text;
}
@end
