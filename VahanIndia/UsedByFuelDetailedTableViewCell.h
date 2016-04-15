//
//  UsedByFuelDetailedTableViewCell.h
//  VahanIndia
//
//  Created by geniemac4 on 10/04/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsedByFuelDetailedTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lbl_modelname;
@property (strong, nonatomic) IBOutlet UILabel *lbl_city;
@property (strong, nonatomic) IBOutlet UILabel *lbl_usedcarprice;
@property (strong, nonatomic) IBOutlet UILabel *lbl_kms;
@property (strong, nonatomic) IBOutlet UILabel *lbl_owner;
@property (strong, nonatomic) IBOutlet UILabel *lbl_fuelname;
@property (strong, nonatomic) IBOutlet UILabel *lbl_transmission;


@property (strong, nonatomic) IBOutlet UIImageView *img_view;

@property (strong, nonatomic) IBOutlet UIView *Viewbg;

@end
