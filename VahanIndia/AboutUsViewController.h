//
//  AboutUsViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 31/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutUsViewController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    UIDocumentInteractionController *documentInteractionController;
}


@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;

@property (strong, nonatomic) IBOutlet UIButton *btn_menu_outlet;
- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;

@end
