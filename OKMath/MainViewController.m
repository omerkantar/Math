//
//  MainViewController.m
//  OKMath
//
//  Created by omer on 22/11/14.
//  Copyright (c) 2014 omer. All rights reserved.
//

#import "MainViewController.h"
#import "StartViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.startButton.layer.cornerRadius = 5.0f;
    
    self.navigationController.navigationBarHidden = YES;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAction:(id)sender {
    StartViewController * startViewController = [[StartViewController alloc] init];
    [self.navigationController pushViewController:startViewController animated:NO];
}
@end
