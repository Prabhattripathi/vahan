//
//  UsedByBodytyoeViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 01/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsedByBodytyoeViewController : UIViewController<UIDocumentInteractionControllerDelegate>

{
    UIDocumentInteractionController *documentInteractionController;
    
}

@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;

- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *table_view;

@end
