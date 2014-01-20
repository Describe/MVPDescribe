//
//  DescSignupViewController.h
//  Describe
//
//  Created by kushal mandala on 05/01/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface DescSignupViewController : UIViewController<UITextFieldDelegate>
{
    MBProgressHUD *HUD;

}
@property (weak, nonatomic) IBOutlet UITextField *txtuserame;
@property (weak, nonatomic) IBOutlet UITextField *txtpassword;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (retain, nonatomic)NSMutableData *signupresponseData;
@property (retain, nonatomic)NSMutableArray *signupjsonArray;
@end
