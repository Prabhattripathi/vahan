//
//  FinanceViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 31/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface FinanceViewController : UIViewController<UIDocumentInteractionControllerDelegate,NIDropDownDelegate,UINavigationControllerDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
    NIDropDown *dropDown;
}


- (IBAction)btn_menu:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;

- (IBAction)btn_share:(id)sender;


@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;



@property (strong, nonatomic) IBOutlet UITextField *txt_mb1;
@property (strong, nonatomic) IBOutlet UITextField *txt_mb2;
@property (strong, nonatomic) IBOutlet UITextField *txt_email;
@property (strong, nonatomic) IBOutlet UITextField *txt_name;
@property (strong, nonatomic) IBOutlet UITextField *txt_monthlyIncome;
@property (strong, nonatomic) IBOutlet UITextField *txt_Rs;




//for drpdown btns...

- (IBAction)btn_newcarloan:(id)sender;
- (IBAction)btn_selectbrand:(id)sender;
- (IBAction)btn_selectModel:(id)sender;
- (IBAction)select_version:(id)sender;
- (IBAction)btn_selectCity:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_newcarloan;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectbrand;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectmodel;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectversion;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectcity;






//date picker...
@property (strong, nonatomic) IBOutlet UIDatePicker *date_picker;
- (IBAction)btn_done:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *VIEW_DATEPICKER;
- (IBAction)btn_dateclick:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displaydate;


- (IBAction)btn_submit:(id)sender;

@end
