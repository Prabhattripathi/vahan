//
//  NewsReviewsTableViewCell.h
//  VahanIndia
//
//  Created by geniemac4 on 14/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsReviewsTableViewCell : UITableViewCell



@property (strong, nonatomic) IBOutlet UILabel *lbl_Title;
@property (strong, nonatomic) IBOutlet UILabel *lbl_shrtdescr;
@property (strong, nonatomic) IBOutlet UILabel *lbl_news_startdate;


@property (strong, nonatomic) IBOutlet UIImageView *img_view;

@property (strong, nonatomic) IBOutlet UIView *Viewbg;


@end
