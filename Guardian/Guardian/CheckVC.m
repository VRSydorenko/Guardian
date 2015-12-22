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

- (IBAction)OnOk:(id)sender {
    self.check.Status = OK;
    
    [self Save];
}

- (IBAction)OnNok:(id)sender {
    self.check.Status = NOK;
    
    [self Save];
}

-(void)Save{
    self.check.CheckDate = [[NSDate alloc] init];
    self.check.Comment = self.textComment.text;
}
@end
