//
//  SearchViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 27/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "NIDropDown.h"


@interface SearchViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate,NIDropDownDelegate,UINavigationControllerDelegate>

{
    UIDocumentInteractionController *documentInteractionController;
    
}

@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;
- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;




//uiviews...

@property (strong, nonatomic) IBOutlet UIView *view_ByBudget;
@property (strong, nonatomic) IBOutlet UIView *view_ByModel;




//radiobtns..

@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_ByBudget;
- (IBAction)btn_ByBudget:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_ByModel;
- (IBAction)btn_ByModel:(id)sender;








//dropdwns..

@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_budget;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_VehicleType;

@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_Make_Brand;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_AnyModel;


- (IBAction)btn_budgetdrpdwn:(id)sender;
- (IBAction)btn_VehicletypeDrpdwn:(id)sender;

- (IBAction)btn_Make_Brand_drpdwn:(id)sender;
- (IBAction)btn_AnyModelDrpdwn:(id)sender;



- (IBAction)btn_Search1:(id)sender;



//MAIN BUTTONS n HIDEN-VIEWS...


- (IBAction)btn_NewCar:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_NewCar;
@property (strong, nonatomic) IBOutlet UIView *view_NewCarr;


- (IBAction)btn_UsedCar:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_UsedCar;
@property (strong, nonatomic) IBOutlet UIView *view_UsedCar;


//USED CAR..

@property (strong, nonatomic) IBOutlet UIView *view_ByBudget2;
@property (strong, nonatomic) IBOutlet UIView *view_ByModel2;


@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_ByBudget2;
- (IBAction)btn_ByBudget2:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_ByModel2;
- (IBAction)btn_ByModel2:(id)sender;


// drpdwns2(used car)...


@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_budgetdrpdwn2;
- (IBAction)btn_budgetdrpdwn2:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_citydrpdown2;
- (IBAction)btn_citydrpdown2:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_MakeBrand2;
- (IBAction)btn_MakeBrand2:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_outlet_Model2;
- (IBAction)btn_Modeldrpdwn2:(id)sender;


//

- (IBAction)btn_Search2:(id)sender;

@end
