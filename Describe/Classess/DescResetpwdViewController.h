//
//  DescResetpwdViewController.h
//  Describe
//
//  Created by kushal mandala on 05/01/14.
//  Copyright (c) 2014 App. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface DescResetpwdViewController : UIViewController
{
    MBProgressHUD *HUD;

}
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (retain, nonatomic)NSMutableData *RPresponseData;
@property (retain, nonatomic)NSMutableArray *RPjsonArray;

@end
