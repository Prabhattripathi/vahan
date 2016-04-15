//
//  SellCarViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 27/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface SellCarViewController : UIViewController<UIDocumentInteractionControllerDelegate,NIDropDownDelegate,UINavigationControllerDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
   
}


@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;


- (IBAction)btn_menu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;
- (IBAction)btn_share:(id)sender;


//for drop downs..select brand,model,version,...,..,..



@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectbrand;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectmodel;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_selectversion;

@property (strong, nonatomic) IBOutlet UIButton *btn_makeYear;

@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_seleectcolor;

@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_noofowner;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_state;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_city;





- (IBAction)btn_selectbrand:(id)sender;
- (IBAction)btn_Select_dropdown:(id)sender;
- (IBAction)btn_SelectVersion_drpdwn:(id)sender;
- (IBAction)btn_NoofOwner:(id)sender;
- (IBAction)btn_selectcolor:(id)sender;
- (IBAction)btn_makeyear:(id)sender;
- (IBAction)btn_SelectState:(id)sender;
- (IBAction)btn_Selectcity:(id)sender;
- (IBAction)btn_chooseFiles:(id)sender;
- (IBAction)btn_sltvrsnacn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lbl_uploadcarphoto;

-(int)getRandomNumberBetween:(int)from to:(int)to;




@property (strong, nonatomic) IBOutlet UITextField *txt_ownername;
@property (strong, nonatomic) IBOutlet UITextField *txt_registrationNo;
@property (strong, nonatomic) IBOutlet UITextField *txt_MakeYear;
@property (strong, nonatomic) IBOutlet UITextField *txt_kmsDriven;
@property (strong, nonatomic) IBOutlet UITextField *txt_pincode;
@property (strong, nonatomic) IBOutlet UITextField *txt_expectedPrice;
@property (strong, nonatomic) IBOutlet UITextField *txt_Remarks;
@property (strong, nonatomic) IBOutlet UITextField *txt_name;
@property (strong, nonatomic) IBOutlet UITextField *txt_emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *txt_MbNo1;
@property (strong, nonatomic) IBOutlet UITextField *txt_MbNo2;





//for date picker..
@property (strong, nonatomic) IBOutlet UIView *dateview;
- (IBAction)btn_dateclick:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_displaydate;

- (IBAction)btn_set:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *date_picker;
@property (strong, nonatomic) IBOutlet UIView *VIEWPICKER;




- (IBAction)btn_SendEnquiry:(id)sender;



@end
