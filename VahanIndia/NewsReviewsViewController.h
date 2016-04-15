//
//  NewsReviewsViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 02/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NewsReviewsViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
    
}

- (IBAction)btn_menu:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;

- (IBAction)btn_share:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *table_view;


@end
