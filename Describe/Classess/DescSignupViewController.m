//
//  DescSignupViewController.m
//  Describe
//
//  Created by kushal mandala on 05/01/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "DescSignupViewController.h"
#import "DescBasicinfoViewController.h"
#import "ConstantValues.h"

@interface DescSignupViewController ()

@end

@implementation DescSignupViewController
@synthesize txtuserame,txtpassword,txtemail,txtname;
@synthesize signupjsonArray,signupresponseData;

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
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    UILabel* lbNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,40,320,40)];
    lbNavTitle.textAlignment = NSTextAlignmentLeft;
    lbNavTitle.text = NSLocalizedString(@"Signup",@"");
    lbNavTitle.textColor=[UIColor whiteColor];
    self.navigationItem.titleView = lbNavTitle;
    
    UIImage *abackbuttonImage = [UIImage imageNamed:@"nav_btn_back.png"];
    UIButton *aabackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aabackButton setImage:abackbuttonImage forState:UIControlStateNormal];
    aabackButton.frame = CGRectMake(0.0, 0.0, abackbuttonImage.size.width, abackbuttonImage.size.height);
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:aabackButton];
    self.navigationItem.rightBarButtonItem=back;
    
    [aabackButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)backClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)nextClicked:(id)sender
{
    
    [txtuserame resignFirstResponder];
    [txtpassword resignFirstResponder];
    [txtemail resignFirstResponder];
    [txtname resignFirstResponder];
    NSString *emailString = txtemail.text; // storing the entered email in a string.
	
	// Regular expression to checl the email format.
	NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,3}";
	
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
    
	// Regular expression to checl the email format.
    if(([txtuserame.text length]==0))
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Validation" message:@"Please enter your username" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
	}
	else if([txtpassword.text length]==0)
	{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Validation" message:@"Please enter password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
	}
    else if([txtemail.text length]==0)
	{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Validation" message:@"Please enter your email" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
	}
    else if(([emailTest evaluateWithObject:emailString] != YES) || [emailString isEqualToString:@""])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validation" message:@"Please enter a valid email address" delegate:self
												   cancelButtonTitle:@"OK" otherButtonTitles:nil];
		
		[alert show];
	}
    else if([txtname.text length]==0)
	{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Validation" message:@"Please enter your name" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
	}
	else
	{
        
        descSignupdict=[[NSMutableDictionary alloc]initWithObjects:[NSArray arrayWithObjects:txtuserame.text,txtpassword.text,txtemail.text,txtname.text, nil] forKeys:[NSArray arrayWithObjects:@"username",@"password",@"email",@"name", nil]];
        NSLog(@"signup dict %@",descSignupdict);
        
        
        DescBasicinfoViewController * signin = [[DescBasicinfoViewController alloc]initWithNibName:@"DescBasicinfoViewController" bundle:Nil];
        
        [self.navigationController pushViewController:signin animated:YES];

    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(self.txtuserame)
		[self.txtuserame resignFirstResponder];
    if(self.txtpassword)
		[self.txtpassword resignFirstResponder];
    if(self.txtemail)
		[self.txtemail resignFirstResponder];
    if(self.txtname)
		[self.txtname resignFirstResponder];
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string; {
    
    if ([self.txtuserame.text length]>0 &&[self.txtpassword.text length]>0 &&[self.txtemail.text length]>0&&[self.txtname.text length]>1) {
        UIImage *abackbuttonImage = [UIImage imageNamed:@"nav_btn_back.png"];
        UIButton *aabackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [aabackButton setImage:abackbuttonImage forState:UIControlStateNormal];
        aabackButton.frame = CGRectMake(0.0, 0.0, abackbuttonImage.size.width, abackbuttonImage.size.height);
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:aabackButton];
        UIImage *abuttonImage = [UIImage imageNamed:@"nav_btn_next.png"];
        UIButton *aaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [aaButton setImage:abuttonImage forState:UIControlStateNormal];
        aaButton.frame = CGRectMake(0.0, 0.0, abuttonImage.size.width, abuttonImage.size.height);
        UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithCustomView:aaButton];
        self.navigationItem.rightBarButtonItem=next;
        self.navigationItem.rightBarButtonItems =
        [NSArray arrayWithObjects:next, back, nil];
        [aabackButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
        [aaButton addTarget:self action:@selector(nextClicked:) forControlEvents:UIControlEventTouchUpInside];
      }
    else
    {
        self.navigationItem.rightBarButtonItems=nil;
        UIImage *abackbuttonImage = [UIImage imageNamed:@"nav_btn_back.png"];
        UIButton *aabackButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [aabackButton setImage:abackbuttonImage forState:UIControlStateNormal];
        aabackButton.frame = CGRectMake(0.0, 0.0, abackbuttonImage.size.width, abackbuttonImage.size.height);
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:aabackButton];
              self.navigationItem.rightBarButtonItem=back;
        
        [aabackButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    return YES;
}// return NO to not change text

- (void)textFieldDidEndEditing:(UITextField *)textField
{
 
    
}

@end
