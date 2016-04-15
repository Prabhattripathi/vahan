//
//  DemoAppDelegate.h
//  VahanIndia
//
//  Created by geniemac4 on 26/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoAppDelegate : UIResponder <UIApplicationDelegate>

//for the detailed ByPrice...
@property (strong, nonatomic) NSString *price_id;

//for the detailed ByBrand...
@property (strong, nonatomic) NSString *brand_id;

//for the detailed ByFuel...
@property (strong, nonatomic) NSString *fuel_id;

//for the detailed BodyType...
@property (strong, nonatomic) NSString *BodyType_id;

//for the detailed CARDEALER...
@property (strong, nonatomic) NSString *cardealer_id;

//for the detailed NEWCAR CARDEALER...
@property (strong, nonatomic) NSString *cardealer_Cityid;


//for the detailed CARSERVICE STN...
@property (strong, nonatomic) NSString *carserviceStn_id;


//for the detailed CARSERVICESTN...
@property (strong, nonatomic) NSString *carserviceStn_Cityid;


//for the BYpricefinal...
@property (strong, nonatomic) NSString *colormodel_id;

//for the BYpricefinal...
@property (strong, nonatomic) NSString *review_id;

//PRICEDETAILED ID..
@property (strong, nonatomic) NSString *priceDetailed_id;


//Carimage for finalcarVC
@property (strong, nonatomic) NSString *CarImage;

//CarName for finalcarVC
@property (strong, nonatomic) NSString *CarName;


//Carprice for finalcarVC in general tab..
@property (strong, nonatomic) NSString *CarPrice;

//CarKMPL for finalcarVC in general tab..
@property (strong, nonatomic) NSString *CarKMPL;


//for the news detailed title..
@property (strong, nonatomic) NSString *NewsDetailTITLE;

//for the news detailed startdate..
@property (strong, nonatomic) NSString *NewsDetailSTARTDATE;

//for the news detailed image..
@property (strong, nonatomic) NSString *NewsDetailIMAGE;

//for the news detailed long description..
@property (strong, nonatomic) NSString *NewsDetailLONGDESCRP;

//for the news detailed USERNAME PRADEEP M..
@property (strong, nonatomic) NSString *NewsDetailUSERNAME;





//FOR USED CAR DETAILED.....



//for the USEDCAR detailed bycity...
@property (strong, nonatomic) NSString *UsedCar_Cityid;


//for the USEDCAR detailed byprice...
@property (strong, nonatomic) NSString *UsedCar_Priceid;


//for the USEDCAR detailed bybrand...
@property (strong, nonatomic) NSString *UsedCar_Brandid;


//for the USEDCAR detailed byfuel...
@property (strong, nonatomic) NSString *UsedCar_Fuelid;


//for the USEDCAR detailed bybodytype...
@property (strong, nonatomic) NSString *UsedCar_BodyTypeid;


//Carimage for USed Car finalllcarVC
@property (strong, nonatomic) NSString *UsedCarImage;


//DETAILED IDs for used detailed API's..
@property (strong, nonatomic) NSString *Used_Detailed_ids;


////NEWS & REVIEWS....


//for the news&reviews detailed title..
@property (strong, nonatomic) NSString *NewsReviewsDetailTITLE;


//for the news&reviews detailed title..
@property (strong, nonatomic) NSString *NewsReviewsSTARTDATE;


//for the news&reviews detailed title..
@property (strong, nonatomic) NSString *NewsReviewsDetailIMAGE;


//for the news&reviews detailed title..
@property (strong, nonatomic) NSString *NewsReviewsDetailLONGDESCRP;


//for the news&reviews detailed title..
@property (strong, nonatomic) NSString *NewsReviewsDetailUSERNAME;

//for sell car...
@property(assign,nonatomic)NSInteger index;


//for compare car's Model list...
@property (strong, nonatomic) NSString *comparecar1ID;


//for compare car's Version list...
@property (strong, nonatomic) NSString *comparecar2ID;


//for compare car's starting view (where select car1 & select car 2 entites r der)...(for carid,carname and carimage..)...
@property (strong, nonatomic) NSString *comparecar3ID;

@property (strong, nonatomic) NSString *comparecar4ID;

@property (strong, nonatomic) NSString *comparecar5ID;

@property (strong, nonatomic) NSString *comparecar6ID;

@property (strong, nonatomic) NSString *comparecar7ID ,*comparecar9ID,*budgetstr ,*vehicaltype ,*brandstr ,*modelstr;




@property (nonatomic, assign) BOOL var;

@property (nonatomic, assign) BOOL test;
@property (nonatomic, assign) BOOL firstbtn;



//sell car state..

@property (strong, nonatomic) NSString *Statestr;







@property (strong, nonatomic) UIWindow *window;



@end
