//
//  DescAddpeopleViewController.m
//  Describe
//
//  Created by NuncSys on 07/01/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import "DescAddpeopleViewController.h"

@interface DescAddpeopleViewController ()

@end

@implementation DescAddpeopleViewController

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
    self.navigationItem.hidesBackButton = YES;
    UILabel* lbNavTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,40,320,40)];
    lbNavTitle.textAlignment = NSTextAlignmentLeft;
    lbNavTitle.text = NSLocalizedString(@"Add People",@"");
    lbNavTitle.textColor=[UIColor whiteColor];
    self.navigationItem.titleView = lbNavTitle;
    self.navigationItem.rightBarButtonItems=nil;
    UIImage *abackbuttonImage = [UIImage imageNamed:@"nav_btn_next.png"];
    UIButton *aabackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [aabackButton setImage:abackbuttonImage forState:UIControlStateNormal];
    aabackButton.frame = CGRectMake(0.0, 0.0, abackbuttonImage.size.width, abackbuttonImage.size.height);
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:aabackButton];
    self.navigationItem.rightBarButtonItem=back;
    [aabackButton addTarget:self action:@selector(nextButton:) forControlEvents:UIControlEventTouchUpInside];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)nextButton:(id)inSender{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Tableview delegate and datasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return Nil;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return Nil;
}

@end
