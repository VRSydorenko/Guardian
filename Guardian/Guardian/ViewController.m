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
    tour = [dataManager getTour];
    
    NSString *buttonTitle = tour == nil ? @"Start" : @"Continue";
    [_button setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonDown:(id)sender {
    [sender setTitle:@"Hello" forState:UIControlStateNormal];
}

@end
