//
//  CarServiceStnFinalViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 10/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarServiceStnFinalViewController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
    
}


@property (strong, nonatomic) IBOutlet UIButton *btn_mennu_outlet;


- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;




@property (strong, nonatomic) IBOutlet UITableView *table_view;

@end
