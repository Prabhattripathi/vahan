//
//  NewsReviewsDetailedTableViewCell.h
//  VahanIndia
//
//  Created by geniemac4 on 14/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsReviewsDetailedTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *lbl_detailNews_TITLE;
@property (strong, nonatomic) IBOutlet UILabel *lbl_detailNews_DATE;
@property (strong, nonatomic) IBOutlet UILabel *lbl_detailnews_username;

@property (strong, nonatomic) IBOutlet UIImageView *img_detailNews_IMG;


@end
