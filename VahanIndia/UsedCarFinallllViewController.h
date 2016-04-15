//
//  UsedCarFinallllViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 11/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UsedCarFinallllViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate>


{
    UIDocumentInteractionController *documentInteractionController;
    
}


@property (strong, nonatomic) IBOutlet UIButton *btn_mennu_outlet;


- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *img_view_ussedcar;

@property (strong, nonatomic) IBOutlet UIView *View_Contents;

@property (strong, nonatomic) IBOutlet UILabel *lbl_carname;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Rs;
@property (strong, nonatomic) IBOutlet UILabel *lbl_color;
@property (strong, nonatomic) IBOutlet UILabel *lbl_mileageKMS;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Owner;
@property (strong, nonatomic) IBOutlet UILabel *lbl_CarbodyStyle;
@property (strong, nonatomic) IBOutlet UILabel *lbl_fuelType;
@property (strong, nonatomic) IBOutlet UILabel *lbl_RegistrationNo;



@end
