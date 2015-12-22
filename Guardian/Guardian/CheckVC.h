//
//  CheckVC.h
//  Guardian
//
//  Created by Eurofunk on 22.12.15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Check.h"

@interface CheckVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelName;

@property (weak, nonatomic) IBOutlet UIButton *buttonOK;
@property (weak, nonatomic) IBOutlet UIButton *buttonNOK;

@property (weak, nonatomic) IBOutlet UITextField *textComment;


@property Check *check;

- (IBAction)OnOk:(id)sender;

- (IBAction)OnNok:(id)sender;

@end
