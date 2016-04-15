//
//  ByPriceFinalViewController.h
//  VahanIndia
//
//  Created by geniemac4 on 03/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ByPriceFinalViewController : UIViewController<UIDocumentInteractionControllerDelegate,MBProgressHUDDelegate>

{
    UIDocumentInteractionController *documentInteractionController;
    
}


@property (strong, nonatomic) IBOutlet UIButton *btn_mennu_outlet;


- (IBAction)btn_menu:(id)sender;

- (IBAction)btn_share:(id)sender;




//for small views...


@property (strong, nonatomic) IBOutlet UIView *view_general;
@property (strong, nonatomic) IBOutlet UIView *view_overview;
@property (strong, nonatomic) IBOutlet UIView *view_photos;
@property (strong, nonatomic) IBOutlet UIView *view_review;
@property (strong, nonatomic) IBOutlet UIView *view_colors;


@property (strong, nonatomic) IBOutlet UIView *view_news;

//FOR HORIZONTAL SCROLL..

@property (strong, nonatomic) IBOutlet UIScrollView *SCROLL_HORIZONTAL;
@property (strong, nonatomic) IBOutlet UIScrollView *SCROLL_VERTICAL;


@property (strong, nonatomic) IBOutlet UICollectionView *collection_view;

@property (strong, nonatomic) IBOutlet UICollectionView *photos_view;


@property (strong, nonatomic) IBOutlet UILabel *lbl_review_brndname;
@property (strong, nonatomic) IBOutlet UILabel *lbl_review_descr;


@property (strong, nonatomic) IBOutlet UILabel *lbl_ovrview_brandname;
@property (strong, nonatomic) IBOutlet UILabel *lbl_ovrview_descr;




@property (strong, nonatomic) IBOutlet UIImageView *img_CAR;
@property (strong, nonatomic) IBOutlet UILabel *lbl_CARname;


//labels fr general tab...

@property (strong, nonatomic) IBOutlet UILabel *lbl_priceGEN;
@property (strong, nonatomic) IBOutlet UILabel *lbl_kmplGEN;

// images fr photos tab...

@property (strong, nonatomic) IBOutlet UIImageView *imgs_photosTAB;



//for news tableview..
@property (strong, nonatomic) IBOutlet UITableView *table_news_view;


@end
