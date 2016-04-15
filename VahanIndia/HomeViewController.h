//
//  HomeViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 26/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface HomeViewController : UIViewController<MBProgressHUDDelegate,UIDocumentInteractionControllerDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
//..kiran share code..
{
    UIDocumentInteractionController *documentInteractionController;
    
}

@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;

@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;

- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;



//search hidden button...
- (IBAction)btn_hiden:(id)sender;


@end
