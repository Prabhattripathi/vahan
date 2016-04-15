//
//  CompareCarViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 02/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompareCarViewController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
    
}



@property (strong, nonatomic) IBOutlet UIImageView *img_selectCar1;
@property (strong, nonatomic) IBOutlet UILabel *lbl_selectCar1;


@property (strong, nonatomic) IBOutlet UIImageView *img_selectCar2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_selectCar2;


- (IBAction)btn_selectCar1HDN:(id)sender;

- (IBAction)btn_selectCar2HDN:(id)sender;


- (IBAction)btn_COMPARE:(id)sender;


@property (strong, nonatomic) IBOutlet UITableView *table_view;


//.....

- (IBAction)btn_menu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;

- (IBAction)btn_share:(id)sender;

@end
