//
//  CompareCarDetailedViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 17/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface CompareCarDetailedViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
    
}


@property (strong, nonatomic) IBOutlet UIButton *btn_mennu_outlet;


- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *table_view;

@end
