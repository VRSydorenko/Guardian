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

@property Check *check;

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIButton *buttonOK;
@property (weak, nonatomic) IBOutlet UIButton *buttonNOK;
@property (weak, nonatomic) IBOutlet UITextView *textComment;

- (IBAction)OnOk:(id)sender;
- (IBAction)OnNok:(id)sender;

- (void)Save;

@end
