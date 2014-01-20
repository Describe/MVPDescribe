//
//  DescResetpwdViewController.m
//  Describe
//
//  Created by kushal mandala on 05/01/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "DescResetpwdViewController.h"
#import "JSON.h"

@interface DescResetpwdViewController ()

@end

@implementation DescResetpwdViewController
@synthesize RPjsonArray,RPresponseData;

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
    lbNavTitle.text = NSLocalizedString(@"Reset",@"");
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
//    HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    HUD.labelText = @"Loading...";
//    HUD.detailsLabelText = @"Please Wait";
//    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
//    [self.view addSubview:HUD];
//    [HUD show:YES];
//    
//    self.RPresponseData = [NSMutableData data];
//    NSString *urlstr=[NSString stringWithFormat:@"http://describeapp.com/service/describe-service/getUserSignin/format=json/Username=%@/UserPwd=%@",txtusername.text,txtpassword.text];
//    urlstr=[urlstr stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    NSLog(@"%@",urlstr);
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]];
//    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(self.txtemail)
		[self.txtemail resignFirstResponder];
   
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if ([self.txtemail.text length]>0 ) {
        
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
    
}


#pragma mark -
#pragma mark connection


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [RPresponseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [RPresponseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	self.RPresponseData = nil;
}

#pragma mark -
#pragma mark finish
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //[connection release];
	[RPjsonArray removeAllObjects];
    NSString *responseString = [[NSString alloc] initWithData:RPresponseData encoding:NSUTF8StringEncoding];
	self.RPresponseData = nil;
    
    NSMutableArray *sdf = [(NSDictionary*)[responseString JSONValue] objectForKey:@"DataTable"];
    NSMutableArray * myArray = [[NSMutableArray alloc] init];
    NSMutableDictionary * myDict = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i<[sdf count]; i++) {
        myDict=[sdf objectAtIndex:i];
        [myArray addObject:[myDict objectForKey:@"UserData"]];
    }
    
    
	self.navigationController.navigationBar.userInteractionEnabled = YES;
    [HUD hide:YES];
    [HUD removeFromSuperview];
    HUD=nil;
}



@end
