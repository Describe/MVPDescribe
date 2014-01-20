//
//  DescSigninViewController.m
//  Describe
//
//  Created by NuncSys on 30/12/13.
//  Copyright (c) 2013 App. All rights reserved.
//

#import "DescSigninViewController.h"
#import "DescResetpwdViewController.h"
#import "ConstantValues.h"
#import "JSON.h"
@interface DescSigninViewController ()

@end

@implementation DescSigninViewController
@synthesize loginjsonArray,loginresponseData;
@synthesize txtusername,txtpassword;
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
    self.navigationController.navigationController.navigationBar.translucent = YES;    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton = YES;
    UILabel* lbNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,40,320,40)];
    lbNavTitle.textAlignment = NSTextAlignmentLeft;
    lbNavTitle.text = NSLocalizedString(@"Signin",@"");
    lbNavTitle.textColor=[UIColor whiteColor];
    self.navigationItem.titleView = lbNavTitle;
    
    UIImage *abackbuttonImage = [UIImage imageNamed:@"nav_btn_back.png"];
    UIButton *aabackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aabackButton setImage:abackbuttonImage forState:UIControlStateNormal];
    aabackButton.frame = CGRectMake(0.0, 0.0, abackbuttonImage.size.width, abackbuttonImage.size.height);
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:aabackButton];
    self.navigationItem.rightBarButtonItem=back;
    
    [aabackButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)addTheButtonAboveNavBarWithImage:(UIImage*)inImage andSize:(CGRect*) inFrame andActionName:(NSString*)inActionName{
    

    
}

-(void)backClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)nextClicked:(id)sender
{
    [self.txtusername resignFirstResponder];
    [self.txtpassword resignFirstResponder];
    
    
    if(([self.txtusername.text length]==0))
    {
        [self showalertMessage:@"Please enter your user name"];
	}
	else if([self.txtpassword.text length]==0)
	{
		[self showalertMessage:@"Please enter your password"];
	}
    else
    {
        
        
    }
}
-(void)showalertMessage:(NSString*)inMeassage{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Validation" message:inMeassage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forgetpwdClicked:(id)sender {
    DescResetpwdViewController * reset = [[DescResetpwdViewController alloc]initWithNibName:@"DescResetpwdViewController" bundle:Nil];
    [self.navigationController pushViewController:reset animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(self.txtusername)
		[self.txtusername resignFirstResponder];
    if(self.txtpassword)
		[self.txtpassword resignFirstResponder];
    
    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string; {
    
    if (textField.tag==2 && [textField.text length]>3) {
        
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
        [aaButton addTarget:self action:@selector(goToNext:) forControlEvents:UIControlEventTouchUpInside];
        
        [aabackButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    }else{
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
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
   
        
      
    }

-(void)goToNext:(id)sender{
    [txtusername resignFirstResponder];
    [txtpassword resignFirstResponder];
	// Regular expression to checl the email format.
    if(([txtusername.text length]==0))
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Validation" message:@"Please enter UserName" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
	}
	else if([txtpassword.text length]==0)
	{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Validation" message:@"Please enter UserName" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
	}
	else
	{
     
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.labelText = @"Loading...";
        HUD.detailsLabelText = @"Please Wait";
        //HUD.mode = MBProgressHUDModeAnnularDeterminate;
        [self.view addSubview:HUD];
        [HUD show:YES];
        
        self.loginresponseData = [NSMutableData data];
        NSString *urlstr=[NSString stringWithFormat:@"http://describeapp.com/service/describe-service/getUserSignin/format=json/Username=%@/UserPwd=%@",txtusername.text,txtpassword.text];
        urlstr=[urlstr stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        NSLog(@"%@",urlstr);
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
   
    
}


#pragma mark -
#pragma mark connection


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [loginresponseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [loginresponseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	self.loginresponseData = nil;
}

#pragma mark -
#pragma mark finish
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //[connection release];
	[loginjsonArray removeAllObjects];
    NSString *responseString = [[NSString alloc] initWithData:loginresponseData encoding:NSUTF8StringEncoding];
	self.loginresponseData = nil;
    
    NSMutableArray *sdf = [(NSDictionary*)[responseString JSONValue] objectForKey:@"DataTable"];
    NSMutableArray * myArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * myDict = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i<[sdf count]; i++) {
        myDict=[sdf objectAtIndex:i];
        [myArray addObject:[myDict objectForKey:@"UserData"]];
    }
    
    if([myArray count]==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Validation" message:@"Invalid Credentials" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
    }
    else {
        loginjsonArray=[myArray mutableCopy];
        NSMutableDictionary *rows=[loginjsonArray objectAtIndex:0];
        NSString *str=[rows objectForKey:@"Msg"];
        if ( [str isEqualToString:@"0"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Information" message:@"Please Activate Your Email Address." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            UserData = [[NSMutableArray alloc] initWithArray:[rows allValues]]; //each object in the array is a dictionary object containing all of the columns and values
            NSLog(@"the userdata is %@",UserData);
            if([rows count]>1)
            {
                describe_userId=[rows objectForKey:@"UserUID"];
                describe_getUserProfileId = [rows objectForKey:@"UserUID"];
                
                
                DescBasicinfoViewController * basicInfo = [[DescBasicinfoViewController alloc]initWithNibName:@"DescBasicinfoViewController" bundle:nil];
                [self.navigationController pushViewController:basicInfo animated:YES];
                
//                feedsPage *feeds=[[feedsPage alloc]initWithNibName:@"feedsPage" bundle:nil];
//                [self.navigationController pushViewController:feeds animated:YES];
                
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Validation" message:@"Invalid Credentials" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
                UserData = nil;
            }
        }
        
    }
    
    
	self.navigationController.navigationBar.userInteractionEnabled = YES;
    [HUD hide:YES];
    [HUD removeFromSuperview];
    HUD=nil;
}

@end
