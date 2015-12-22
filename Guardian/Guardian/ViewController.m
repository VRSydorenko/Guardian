//
//  ViewController.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "ViewController.h"
#import "ChecksVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataManager = [[DataManager alloc] init];
    dataManager.delegate = self;
    [dataManager getTour];
    
}

-(void)onTourFetched:(Tour *)tour
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *buttonTitle = tour == nil ? @"Start" : @"Continue";
        [_buttonTour setTitle:buttonTitle forState:UIControlStateNormal];
        _buttonTour.hidden = NO;
    });
}

- (IBAction)onButtonTour:(id)sender
{
    if ([dataManager getCurrentTour] != nil)
    {
        
    }
    else
    {
        [dataManager startTour];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Tour *tour = [dataManager getCurrentTour];
    if ([segue.identifier isEqualToString:@"segueMainToTour"])
    {
        if (tour == nil)
        {
            // TODO: cancel segue
        }
        else
        {
            ChecksVC *checksVC = (ChecksVC*)segue.destinationViewController;
            checksVC.currentTour = tour;
        }
    }
}

@end
