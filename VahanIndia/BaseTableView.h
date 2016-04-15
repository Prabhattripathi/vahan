//
//  BaseTableView.h
//  Faida
//
//  Created by Santosh  on 10/02/14.
//  Copyright (c) 2014 geniemac5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "DemoAppDelegate.h"
#import "homeViewController.h"
//#import "SA_OAuthTwitterController.h"

@class SA_OAuthTwitterEngine;

@protocol SelectedCatDelegate
@optional

- (void)selectedCatIndex:(int)index;

@end

@interface BaseTableView : UIView <UITableViewDataSource,UITableViewDelegate,MBProgressHUDDelegate>
{
    NSMutableArray *catnamearray,*catnamearrayImages,*catnamearrayRtArrowImages;
    MBProgressHUD *HUD;
   // id<SelectedCatDelegate>   delegate;  this is for data changing in same viewcontroller
    
    DemoAppDelegate *app;

}
//@property (nonatomic, assign) id<SelectedCatDelegate> delegate;
@property(nonatomic,strong)UITableView    *menuTableView;

// for calling method


@end
