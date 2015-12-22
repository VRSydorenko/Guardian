//
//  ViewController.h
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "Tour.h"

@interface ViewController : UIViewController
{
    DataManager *dataManager;
    Tour *tour;
}

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

