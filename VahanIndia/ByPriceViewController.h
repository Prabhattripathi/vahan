//
//  ByPriceViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 27/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ByPriceViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate>
//..kiran share code..
{
    UIDocumentInteractionController *documentInteractionController;
    
}


@property (strong, nonatomic) IBOutlet UIButton *btn_mennu_outlet;


- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *table_view;

//for small views...




@end
