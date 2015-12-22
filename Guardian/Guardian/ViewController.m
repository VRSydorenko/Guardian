//
//  ViewController.m
//  Guardian
//
//  Created by VRS on 22/12/15.
//  Copyright © 2015 Viktor Sydorenko. All rights reserved.
//

#import "ViewController.h"

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
    });
}

- (IBAction)onButtonDown:(id)sender {
    [sender setTitle:@"Hello" forState:UIControlStateNormal];
}

@end
