//
//  DescBasicinfoViewController.h
//  Describe
//
//  Created by NuncSys on 30/12/13.
//  Copyright (c) 2013 App. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface DescBasicinfoViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
    MBProgressHUD *HUD;

}
@property (weak, nonatomic) IBOutlet UIImageView *userprofileimg;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtbirthday;
@property (weak, nonatomic) IBOutlet UITextView *txtBio;
@property (weak, nonatomic) IBOutlet UIButton *btnmale;
@property (weak, nonatomic) IBOutlet UIButton *btnfemale;
@property (strong, nonatomic) IBOutlet UIView *datePickerView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *profileimgbtn;
@property (retain, nonatomic)NSMutableData *BIresponseData;
@property (retain, nonatomic)NSMutableArray *BIjsonArray;
- (IBAction)selectTheDate:(id)sender;
- (IBAction)maleClicked:(id)sender;
- (IBAction)femaleClicked:(id)sender;
- (IBAction)selectprofileimg:(id)sender;
- (IBAction)dateDoneClicked:(id)sender;
@end
