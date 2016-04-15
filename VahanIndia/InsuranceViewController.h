//
//  InsuranceViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 02/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface InsuranceViewController : UIViewController<UIDocumentInteractionControllerDelegate,NIDropDownDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
     NIDropDown *dropDown;
}



@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;
- (IBAction)btn_menu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;

- (IBAction)btn_share:(id)sender;

//for radiobtns...

- (IBAction)btn_privatecar:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_privatecar_outlet;

- (IBAction)btn_passengercar:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_passengercar_outlet;

- (IBAction)btn_NewCarInsurancePol:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_NewCarInsurancePol_outlet;

- (IBAction)btn_RenewCarInsPol:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_RenewCarInsPol_outlet;

//fr dropdwn Action btns ..
- (IBAction)btn_selectbrand:(id)sender;
- (IBAction)btn_selectmodel:(id)sender;
- (IBAction)btn_selectversion:(id)sender;
- (IBAction)btn_selectfuel:(id)sender;
- (IBAction)btn_selectcity:(id)sender;


//for drpdown outlets btns ...
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectbrand;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectmodel;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectversion;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_SelectFuel;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectCity;




//hidden view for Renew Car...
@property (strong, nonatomic) IBOutlet UIView *view_hide;


- (IBAction)btn_radioYES:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_radioYES;


- (IBAction)btn_radioNO:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_radioNO;


@property (strong, nonatomic) IBOutlet UILabel *lbl_displaydate;

- (IBAction)btn_dateclick:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *VIEWPICKER;
@property (strong, nonatomic) IBOutlet UIDatePicker *date_picker;
- (IBAction)btn_set:(id)sender;


//textfields...

@property (strong, nonatomic) IBOutlet UITextField *txt_invoiceValue;
@property (strong, nonatomic) IBOutlet UITextField *txt_RegistrationNo;
@property (strong, nonatomic) IBOutlet UITextField *txt_name;
@property (strong, nonatomic) IBOutlet UITextField *txt_emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *txt_Mb2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Pincode;




- (IBAction)btn_CONTINUE:(id)sender;


@end
