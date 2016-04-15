//
//  NewCarViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 26/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCarViewController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
    
}

- (IBAction)btn_menu:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;

- (IBAction)btn_share:(id)sender;




@property (strong, nonatomic) IBOutlet UITableView *table_view;

@end
