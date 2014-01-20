//
//  DescWelcomeViewController.m
//  Describe
//
//  Created by NuncSys on 30/12/13.
//  Copyright (c) 2013 App. All rights reserved.
//

#import "DescWelcomeViewController.h"
#import "DescSignupViewController.h"
#import "DescSigninViewController.h"

@interface DescWelcomeViewController ()

@end

@implementation DescWelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor headerColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_topbar.png"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationController.navigationBar.translucent = NO;

}

- (IBAction)SigninClicked:(id)sender {
    
    DescSigninViewController * signin = [[DescSigninViewController alloc]initWithNibName:@"DescSigninViewController" bundle:Nil];
    [self.navigationController pushViewController:signin animated:YES];
}

- (IBAction)signUpTheUser:(id)sender {
    
    DescSignupViewController * signUpView = [[DescSignupViewController alloc]initWithNibName:@"DescSignupViewController" bundle:Nil];
    [self.navigationController pushViewController:signUpView animated:YES];
    
}

- (IBAction)addPeople:(id)sender {
    
    DescAddpeopleViewController * addPeople = [[DescAddpeopleViewController alloc]initWithNibName:@"DescAddpeopleViewController" bundle:Nil];
    [self.navigationController pushViewController:addPeople animated:YES];
    
}


@end
