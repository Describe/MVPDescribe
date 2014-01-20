//
//  DescBasicinfoViewController.m
//  Describe
//
//  Created by NuncSys on 30/12/13.
//  Copyright (c) 2013 App. All rights reserved.
//

#import "DescBasicinfoViewController.h"
#import <QuartzCore/CAAnimation.h>
#import "JSON.h"

@interface DescBasicinfoViewController ()

@end

@implementation DescBasicinfoViewController
@synthesize txtBio,txtbirthday,txtCity;
@synthesize BIjsonArray,BIresponseData;

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
    lbNavTitle.text = NSLocalizedString(@"Basicinfo",@"");
    lbNavTitle.textColor=[UIColor whiteColor];
    self.navigationItem.titleView = lbNavTitle;
    txtBio.backgroundColor=[UIColor clearColor];
    
    UIImage *abuttonImage = [UIImage imageNamed:@"nav_btn_next.png"];
    UIButton *aaButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[aaButton setImage:abuttonImage forState:UIControlStateNormal];
	aaButton.frame = CGRectMake(0.0, 0.0, abuttonImage.size.width, abuttonImage.size.height);
	UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithCustomView:aaButton];
    self.navigationItem.rightBarButtonItem=next;
    [aaButton addTarget:self action:@selector(nextClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.datePicker  setDate:[NSDate date] animated:NO];
	self.datePicker.maximumDate=[NSDate date];

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
//    self.BIresponseData = [NSMutableData data];
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

- (IBAction)maleClicked:(id)sender {
    
    [self.btnmale setImage:[UIImage imageNamed:@"male_active.png"] forState:UIControlStateNormal];
    [self.btnfemale setImage:[UIImage imageNamed:@"female_inactive.png"] forState:UIControlStateNormal];

}
- (IBAction)femaleClicked:(id)sender {
    [self.btnmale setImage:[UIImage imageNamed:@"male_inactive.png"] forState:UIControlStateNormal];
    [self.btnfemale setImage:[UIImage imageNamed:@"female_active.png"] forState:UIControlStateNormal];
}

- (IBAction)selectprofileimg:(id)sender {
    
    UIActionSheet *chooseOption = [[UIActionSheet alloc] initWithTitle:@"ChooseSource" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"PhotoLibrary", nil];
    [chooseOption showInView:self.view];
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0) {
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *openLibrary = [[UIImagePickerController alloc] init];
            openLibrary.sourceType = UIImagePickerControllerSourceTypeCamera;
            openLibrary.delegate = self;
            [self presentViewController:openLibrary animated:YES completion:nil];
        }
    }
    else if(buttonIndex==1) {
        UIImagePickerController *openLibrary = [[UIImagePickerController alloc] init];
        openLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        openLibrary.delegate = self;
        [self presentViewController:openLibrary animated:YES completion:nil];
    }
   
    else if(buttonIndex == 3) {
        //cancel
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@",[info description]);
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    self.userprofileimg.image=image;
    CALayer * l = [self.userprofileimg layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:self.userprofileimg.bounds.size.width / 2.0];
     [l setBorderColor:[[UIColor grayColor] CGColor]];
    //[l setBorderWidth:2.0];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)selectTheDate:(id)sender {
    
    self.datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    //[self.datePicker addTarget:self action:@selector(dueDateChanged:) forControlEvents:UIControlEventValueChanged];
//    CGSize pickerSize = [picker sizeThatFits:CGSizeZero];
//    picker.frame = CGRectMake(0.0, 340, pickerSize.width, 460);
    
    CGRect rect;
	rect = [self.datePickerView frame];
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    if (result.height < 500)
    {
        //4s
        rect.origin.y = 160;
    }
    else
    {
        //5
        rect.origin.y = 340;
    }
    
    
	
	rect.size.height = 280;
    self.datePickerView.frame = rect;
	
	[self.view addSubview:self.datePickerView];
}


- (IBAction)dateDoneClicked:(id)sender {
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    //self.myLabel.text = [dateFormatter stringFromDate:[dueDatePickerView date]];
    NSLog(@"Picked the date %@", [dateFormatter stringFromDate:[self.datePicker date]]);
    self.txtbirthday.text=[dateFormatter stringFromDate:[self.datePicker date]];
    [self.datePickerView removeFromSuperview];

}
-(void) dueDateChanged:(UIDatePicker *)sender {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    //self.myLabel.text = [dateFormatter stringFromDate:[dueDatePickerView date]];
    NSLog(@"Picked the date %@", [dateFormatter stringFromDate:[sender date]]);
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(self.txtbirthday)
		[self.txtbirthday resignFirstResponder];
    if(self.txtCity)
		[self.txtCity resignFirstResponder];
    
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    // Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}



#pragma mark -
#pragma mark connection


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [BIresponseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [BIresponseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	self.BIresponseData = nil;
}

#pragma mark -
#pragma mark finish
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    //[connection release];
	[BIjsonArray removeAllObjects];
    NSString *responseString = [[NSString alloc] initWithData:BIresponseData encoding:NSUTF8StringEncoding];
	self.BIresponseData = nil;
    
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
